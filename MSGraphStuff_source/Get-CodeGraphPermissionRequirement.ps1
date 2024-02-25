﻿function Get-CodeGraphPermissionRequirement {
    <#
    .SYNOPSIS
    Function for getting Graph API permissions (scopes) that are needed tu run selected code.

    Official Graph SDK commands AND direct Graph API calls are both processed :)

    .DESCRIPTION
    Function for getting Graph API permissions (scopes) that are needed tu run selected code.

    All official Graph SDK commands (*-Mg*) AND commands making direct Graph API calls (Invoke-MsGraphRequest, Invoke-RestMethod, Invoke-WebRequest and their aliases) are extracted using 'Get-CodeDependency' function (DependencySearch module).
    Permissions required to use these commands are retrieved using official 'Find-MgGraphCommand' command then.

    .PARAMETER scriptPath
    Path to ps1 script that should be analyzed.

    .PARAMETER permType
    What type of permissions you want to retrieve.

    Possible values: application, delegated.

    By default 'application'.

    .PARAMETER availableModules
    To speed up repeated function invocations, save all available modules into variable and use it as value for this parameter.

    By default this function caches all locally available modules before each run which can take several seconds.

    .PARAMETER goDeep
    Switch to check for dependencies not just in the given code, but even in its dependencies (recursively). A.k.a. get the whole dependency tree.

    .EXAMPLE
    $availableModules = @(Get-Module -ListAvailable)
    Get-CodeGraphPermissionRequirement -scriptPath C:\temp\SensitiveAppBlock.ps1 -availableModules $availableModules | ogv
    #>

    [CmdletBinding()]
    [Alias("Get-CodeGraphPermission", "Get-CodeGraphScope", "Get-GraphAPICodePermission", "Get-GraphAPICodeScope")]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ((Test-Path -Path $_ -PathType leaf) -and $_ -match "\.ps1$") {
                    $true
                } else {
                    throw "$_ is not a ps1 file or it doesn't exist"
                }
            })]
        [string] $scriptPath,

        [ValidateSet('application', 'delegated')]
        [string[]] $permType = "application",

        [System.Collections.ArrayList] $availableModules = @(),

        [switch] $goDeep
    )

    if (!(Get-Command "Find-MgGraphCommand" -ErrorAction SilentlyContinue)) {
        throw "'Find-MgGraphCommand' command is missing. Install 'Microsoft.Graph.Authentication' module and run again"
    }

    #TODO podpora URI skrze invoke-webrequest (curl, iwr, wget), Invoke-MsGraphRequest, invoke-restmethod (irm)
    # commands that can be used to directly call Graph API
    $webCommandList = "Invoke-MgGraphRequest", "Invoke-MsGraphRequest", "Invoke-RestMethod", "irm", "Invoke-WebRequest", "curl", "iwr", "wget"

    $param = @{
        scriptPath                   = $scriptPath
        processJustMSGraphSDK        = $true
        allOccurrences               = $true
        dontSearchCommandInPSGallery = $true
        processEveryTime             = $webCommandList
    }
    if ($availableModules) {
        $param.availableModules = $availableModules
    }
    if ($goDeep) {
        $param.goDeep = $true
    }

    $usedGraphCommand = Get-CodeDependency @param | ? { ($_.Type -eq "Module" -and $_.Name -like "Microsoft.Graph.*") -or $_.DependencyPath[-1] -in $webCommandList }

    $processedGraphCommand = @()

    if ($usedGraphCommand) {
        foreach ($mgCommandData in $usedGraphCommand) {
            $mgCommand = $mgCommandData.DependencyPath[-1]
            $dependencyPath = $mgCommandData.DependencyPath
            $invocationText = $mgCommandData.RequiredBy
            $method = $null
            $apiVersion = $null

            Write-Verbose "Processing: $invocationText"

            if ($mgCommand -eq "Connect-MgGraph") {
                # no permission needed
                continue
            }

            if ($mgCommand -in $processedGraphCommand) {
                continue
            }

            #region get required Graph permission
            if ($mgCommand -in $webCommandList) {
                # processing a "web" command (direct API call)

                #region get called URI
                if ($mgCommand -in "Invoke-MgGraphRequest", "Invoke-MsGraphRequest") {
                    # these commands should have call Graph API, hence more relaxed search for Graph URI
                    $uri = $invocationText -split " " | ? { $_ -like "*graph.microsoft.com/*" -or $_ -like "*v1.0/*" -or $_ -like "*beta/*" -or $_ -like "*/*" }
                } elseif ($mgCommand -in "Invoke-RestMethod", "irm", "Invoke-WebRequest", "curl", "iwr", "wget") {
                    # these commands can, but don't have to call Graph API, hence more restrictive search for Graph URI
                    $uri = $invocationText -split " " | ? { $_ -like "*graph.microsoft.com/*" -or $_ -like "*v1.0/*" -or $_ -like "*beta/*" }
                } else {
                    throw "$mgCommand is in `$webCommandList, but missing elseif statement in the function code. Fix it"
                }

                if (!$uri) {
                    if ($invocationText -like "Invoke-MgGraphRequest *" -or $invocationText -like "Invoke-MsGraphRequest *") {
                        # Invoke-MgGraphRequest and Invoke-MsGraphRequest commands for sure uses Graph Api, hence output empty object to highlight I was unable to extract it
                        Write-Warning "Unable to extract URI from '$invocationText'. Skipping."
                        '' | select @{n = 'Command'; e = { $mgCommand } }, Name, Description, FullDescription, @{n = 'Type'; e = { $null } }, @{n = 'InvokedAs'; e = { $invocationText } }, @{n = 'DependencyPath'; e = { $dependencyPath } }, @{n = 'ApiVersion'; e = { $null } }, @{n = 'Method'; e = { $null } }, @{n = 'Error'; e = { "Unable to extract URI" } }
                    } else {
                        Write-Verbose "Unable to extract URI from '$invocationText' or it is not a Graph URI. Skipping."
                    }

                    continue
                }
                #endregion get called URI

                #region convert called URI to searchable form
                # get rid of quotes
                $uri = $uri -replace "`"|'"
                # get rid of filter section
                $uri = ($uri -split "\?")[0]
                # replace variables for {id} placeholder (it is just guessing that user put variable int he url instead of ID)
                $uri = $uri -replace "\$[^/]+", "{id}"
                #endregion convert called URI to searchable form

                # find requested method
                $method = $invocationText -split " " | ? { $_ -in "GET", "POST", "PUT", "PATCH", "DELETE" }
                if (!$method) {
                    # select the default method
                    $method = "GET"
                }

                # find requested api version
                if ($uri -like "*beta*") {
                    $apiVersion = "beta"
                } else {
                    $apiVersion = "v1.0"
                }

                # find graph command/permission(s) for called URI, Method and Api version
                try {
                    Write-Verbose "Get permissions for URI: '$uri', Method: $method, ApiVersion: $apiVersion"
                    $mgCommandPerm = Find-MgGraphCommand -Uri $uri -Method $method -ApiVersion $apiVersion -ErrorAction Stop | ? Permissions | select -First 1 -ExpandProperty Permissions

                    if (!$mgCommandPerm) {
                        # try again with not as specific uri (higher chance it will find some permission)
                        $uriSplitted = $uri.split("/")
                        $uri = $uriSplitted[0..($uriSplitted.count - 2)] -join "/"
                        $mgCommandPerm = Find-MgGraphCommand -Uri $uri -Method $method -ApiVersion $apiVersion -ErrorAction Stop | ? Permissions | select -First 1 -ExpandProperty Permissions
                    }
                } catch {
                    Write-Warning "'Find-MgGraphCommand' was unable to find permissions for URI: '$uri', Method: $method, ApiVersion: $apiVersion"
                    '' | select @{n = 'Command'; e = { $mgCommand } }, Name, Description, FullDescription, @{n = 'Type'; e = { $null } }, @{n = 'InvokedAs'; e = { $invocationText } }, @{n = 'DependencyPath'; e = { $dependencyPath } }, @{n = 'ApiVersion'; e = { $apiVersion } }, @{n = 'Method'; e = { $method } }, @{n = 'Error'; e = { "'Find-MgGraphCommand' was unable to find permissions for given URI, Method and ApiVersion" } }
                    continue
                }
            } else {
                # processing a built-in graph sdk command
                $processedGraphCommand += $mgCommand

                # find graph permission(s) for called Graph SDK command
                try {
                    $mgCommandPerm = Find-MgGraphCommand -Command $mgCommand -ErrorAction Stop | ? Permissions | select -First 1 -ExpandProperty Permissions
                } catch {
                    Write-Warning "'Find-MgGraphCommand' was unable to find command '$mgCommand'?!"
                    continue
                }
            }
            #endregion get required Graph permission

            if ($mgCommandPerm) {
                # some Graph permissions are required
                if ("application" -eq $permType) {
                    $mgCommandPerm = $mgCommandPerm | ? IsAdmin -EQ $true
                } elseif ("delegated" -eq $permType) {
                    $mgCommandPerm = $mgCommandPerm | ? IsAdmin -EQ $false
                } else {
                    # no change to found permissions needed, both type should be returned
                }

                #region helper functions
                function _permType {
                    # returns permission type
                    param ($perm)

                    if ($perm.IsAdmin) {
                        return "Application"
                    } else {
                        return "Delegated"
                    }
                }

                function _apiVersion {
                    if ($apiVersion) {
                        # URI invocation
                        return $apiVersion
                    } else {
                        # Graph command invocation
                        return (Find-MgGraphCommand -Command $mgCommand).APIVersion | select -Unique
                    }
                }

                function _method {
                    if ($method) {
                        # URI invocation
                        return $method
                    } else {
                        # Graph command invocation
                        return (Find-MgGraphCommand -Command $mgCommand).Method | select -Unique
                    }
                }
                #endregion helper functions

                if ($mgCommandPerm) {
                    $mgCommandPerm | select @{n = 'Command'; e = { $mgCommand } }, Name, Description, FullDescription, @{n = 'Type'; e = { _permType $_ } }, @{n = 'InvokedAs'; e = { $invocationText } }, @{n = 'DependencyPath'; e = { $dependencyPath } }, @{n = 'ApiVersion'; e = { _apiVersion } }, @{n = 'Method'; e = { _method $mgCommand } }, @{n = 'Error'; e = { $null } }
                } else {
                    Write-Warning "$mgCommand requires some permissions, but not of '$permType' type"
                }
            } else {
                # no Graph permissions are required?!
                if ($mgCommand -in $webCommandList) {
                    $cmd = $invocationText
                } else {
                    $cmd = $mgCommand
                }
                Write-Verbose "'$cmd' doesn't need any permissions?!"
                '' | select @{n = 'Command'; e = { $mgCommand } }, Name, Description, FullDescription, @{n = 'Type'; e = { $null } }, @{n = 'InvokedAs'; e = { $invocationText } }, @{n = 'DependencyPath'; e = { $dependencyPath } }, @{n = 'ApiVersion'; e = { _apiVersion $mgCommand } }, @{n = 'Method'; e = { _method $mgCommand } }, @{n = 'Error'; e = { $null } }
            }
        }

        Write-Warning "Be noted that it is impossible to tell whether found permissions for some command are all required, or just some subset of them (for least-privileged access). Consult the Microsoft Graph Permissions Reference documentation to identify the least-privileged permission for your use case :("
    } else {
        if ($goDeep) {
            Write-Warning "No Graph commands nor direct Graph API calls were found in '$scriptPath' or it's dependency tree"
        } else {
            Write-Warning "No Graph commands nor direct Graph API calls were found in '$scriptPath'"
        }
    }
}