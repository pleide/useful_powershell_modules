#
# Module manifest for module 'IntuneStuff'
#
# Generated by: @AndrewZtrhgf
#
# Generated on: 20.03.2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'IntuneStuff.psm1'

# Version number of this module.
ModuleVersion = '1.4.7'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'a69f8a7d-33d7-43ee-b45b-195896313942'

# Author of this module
Author = '@AndrewZtrhgf'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2022 @AndrewZtrhgf. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Various Intune related functions. Some of them are explained at https://doitpsway.com/series/sccm-mdt-intune.

Some of the interesting functions:
- Get-IntuneRemediationScriptLocally - gets Intune Remediation scripts information from client`s log files and registry (including scripts content)
- Get-IntuneScriptLocally - gets Intune (non-remediation) scripts information from client`s registry and captured script files (including scripts content)
- Get-IntuneWin32AppLocally - gets Win32Apps information from client`s log files and registry (including install/uninstall commands and detection/requirements scripts)
- Get-ClientIntunePolicyResult - RSOP/gpresult for Intune (also available as HTML report)
- Get-IntuneAuditEvent - get Intune Audit events
- Get-IntuneLog - opens Intune logs (files & system logs)
- Get-IntunePolicy - gets ALL Intune (assignable) policies (from Apps to Windows Update Rings)
- Get-UserSIDForUserAzureID - translates user AzureID to local SID
- Invoke-IntuneCommand - "Invoke-Command" alternative for Intune managed Windows clients :)
- Invoke-MDMReenrollment - resets device Intune management connection
- Invoke-IntuneScriptRedeploy - redeploy script deployed from Intune
- Invoke-IntuneWin32AppRedeploy - redeploy application deployed from Intune
- Invoke-IntuneWin32AppAssignment - assign selected Win32 apps
- Remove-IntuneWin32AppAssignment - deassign selected Win32 apps
- Reset-HybridADJoin - reset Hybrid AzureAD join connection
- Reset-IntuneEnrollment - reset device Intune management enrollment
- Search-IntuneAccountPolicyAssignment - search user/device/group assigned Intune policies
- Set-AADDeviceExtensionAttribute - set/reset device extension attribute
- Upload-IntuneAutopilotHash - upload given autopilot hash (owner and hostname) into Intune
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
               'PSWriteHtml', 
               'Microsoft.Graph.DeviceManagement.Administration', 
               'Microsoft.Graph.Authentication', 
               'Microsoft.Graph.Intune', 
               'Microsoft.Graph.DirectoryObjects', 
               'Microsoft.Graph.Devices.CorporateManagement', 
               'Microsoft.Graph.Beta.DeviceManagement', 
               'Microsoft.Graph.Groups', 
               'WindowsAutoPilotIntune', 
               'CommonStuff', 
               'MSGraphStuff', 
               'MSAL.PS')

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
FunctionsToExport = 'Connect-MSGraph2', 'ConvertFrom-MDMDiagReport', 
               'ConvertFrom-MDMDiagReportXML', 
               'Get-BitlockerEscrowStatusForAzureADDevices', 
               'Get-ClientIntunePolicyResult', 'Get-HybridADJoinStatus', 
               'Get-IntuneAuditEvent', 'Get-IntuneDeviceComplianceStatus', 
               'Get-IntuneEnrollmentStatus', 'Get-IntuneLog', 
               'Get-IntuneLogRemediationScriptData', 'Get-IntuneLogWin32AppData', 
               'Get-IntuneLogWin32AppReportingResultData', 
               'Get-IntuneOverallComplianceStatus', 'Get-IntunePolicy', 
               'Get-IntuneRemediationScriptLocally', 'Get-IntuneReport', 
               'Get-IntuneScriptContentLocally', 'Get-IntuneScriptLocally', 
               'Get-IntuneWin32AppLocally', 'Get-MDMClientData', 
               'Get-UserSIDForUserAzureID', 'Invoke-IntuneCommand', 
               'Invoke-IntuneRemediationOnDemand', 'Invoke-IntuneScriptRedeploy', 
               'Invoke-IntuneWin32AppAssignment', 'Invoke-IntuneWin32AppRedeploy', 
               'Invoke-MDMReenrollment', 'Invoke-ReRegisterDeviceToIntune', 
               'New-IntuneRemediation', 'Remove-IntuneRemediation', 
               'Remove-IntuneWin32AppAssignment', 'Reset-HybridADJoin', 
               'Reset-IntuneEnrollment', 'Search-IntuneAccountPolicyAssignment', 
               'Upload-IntuneAutopilotHash'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Assign-IntuneWin32App', 'Connect-MSGraphApp2', 
               'Get-IntuneAccountPolicyAssignment', 'Get-IntuneClientPolicyResult', 
               'Get-IntuneJoinStatus', 'Get-IntunePolicyResult', 
               'Invoke-IntuneEnrollmentRepair', 'Invoke-IntuneEnrollmentReset', 
               'Invoke-IntuneOnDemandRemediation', 'Invoke-IntuneReenrollment', 
               'Invoke-IntuneRemediationScriptOnDemand', 
               'Invoke-IntuneScriptRedeployLocally', 
               'Invoke-IntuneWin32AppRedeployLocally', 'ipresult', 
               'Repair-IntuneEnrollment', 'Reset-IntuneJoin', 
               'Search-IntuneAccountAppliedPolicy'

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
        Tags = 'MEMCM','PowerShell','Intune','MDM','IntuneStuff'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/ztrhgf/useful_powershell_modules'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
            1.4.3
            * FIXED
                * Get-IntunePolicy returns assignments when basicOverview is used

            1.4.5
            * FIXED
                * Invoke-IntuneScriptRedeploy redeploy when getDataFromIntune is used
                * Get-IntuneReport filter check for app report
            * ADDED
                * Invoke-IntuneWin32AppAssignment
                * Remove-IntuneWin32AppAssignment
                
            1.4.6
            * ADDED
                * Invoke-IntuneScriptRedeploy - noDetails switch
                * Invoke-IntuneWin32AppRedeploy - noDetails switch
        
            1.4.7
            * ADDED
                * Invoke-IntuneCommand
                * Invoke-IntuneRemediationOnDemand
                * New-IntuneRemediation
                * Remove-IntuneRemediation
            * REMOVED
                * Get-IntuneRemediationScript (duplicity with Get-IntuneRemediationScriptLocally)
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

