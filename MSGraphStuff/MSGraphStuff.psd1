#
# Module manifest for module 'MSGraphStuff'
#
# Generated by: @AndrewZtrhgf
#
# Generated on: 11.03.2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'MSGraphStuff.psm1'

# Version number of this module.
ModuleVersion = '1.0.8'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '712b70b5-7e0d-4d83-a2e5-68389e890337'

# Author of this module
Author = '@AndrewZtrhgf'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2022 @AndrewZtrhgf. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Graph API related functions. Some of them are explained at https://doitpsway.com.

Some of the functions:
- Expand-MgAdditionalProperties - Function for expanding "AdditionalProperties" hash property to the main object aka flattens the returned object
- Get-CodeGraphModuleDependency - Function for getting Graph SDK modules required to run given code
- Get-CodeGraphPermissionRequirement - Function for getting Graph API permissions (scopes) that are needed tu run selected code
- Invoke-GraphAPIRequest - Function for creating request against Microsoft Graph API. Unlike official one supports paging and throttling
- New-GraphAPIAuthHeader - Function for generating header that can be used for authentication of Graph API requests
- ...
'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('Az.Accounts', 
               'MSAL.PS', 
               'DependencySearch')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Expand-MgAdditionalProperties', 'Get-CodeGraphModuleDependency', 
               'Get-CodeGraphPermissionRequirement', 'Invoke-GraphAPIRequest', 
               'New-GraphAPIAuthHeader'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-CodeGraphPermission', 'Get-CodeGraphScope', 
               'Get-GraphAPICodeModuleDependency', 'Get-GraphAPICodePermission', 
               'Get-GraphAPICodeScope', 'Get-IntuneAuthHeader', 'Invoke-MgRequest', 
               'New-IntuneAuthHeader', 'New-MgAuthHeader'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'PowerShell','Graph','Microsoft','API','MSGraph','MSGraphStuff'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/ztrhgf/useful_powershell_modules'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
            * 1.0.5
                * EDIT
                    * Get-CodeGraphPermissionRequirement - new aliases, support for both permType, added method, apiVersion to the output, added searching for graph api calls using Invoke-MsGraphRequest, Invoke-RestMethod, Invoke-WebRequest and their aliases
                * BUGFIX
                    * Get-CodeDependency - fixed skipping of modules when processJustMSGraphSDK switch is used
            * 1.0.6
                * EDIT
                    * Get-CodeGraphPermissionRequirement - new examples and checks
                * ADDED
                    * Get-CodeGraphModuleDependency 
            * 1.0.7
                * EDIT
                    * Get-CodeGraphPermissionRequirement - permissions output optimized by default, to change that use dontFilterPermissions
            * 1.0.8
                * BUGFIX
                    * Get-CodeGraphModuleDependency - ignore Import-Module results, fixed DependencyPath extraction
                * EDIT
                    * Get-CodeGraphPermissionRequirement - added switch allOccurrences, removed unknownDependencyAsObject parameter when searching for dependencies, because there is no real reason to return such results
                '

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

