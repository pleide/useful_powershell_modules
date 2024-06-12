#
# Module manifest for module 'AzureResourceStuff'
#
# Generated by: @AndrewZtrhgf
#
# Generated on: 12.06.2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'AzureResourceStuff.psm1'

# Version number of this module.
ModuleVersion = '1.0.11'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '6f9132bb-ec13-43d9-86ea-2bba4017e71e'

# Author of this module
Author = '@AndrewZtrhgf'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2022 @AndrewZtrhgf. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Various Azure related functions focused on resources. More details at https://doitpshway.com/series/azure.
Some of the interesting functions:
- Export-VariableToStorage - save PowerShell variable as XML file in Azure Blob storage
- Get-AzureResource - return resources for all or just selected Azure subscription(s)
- Get-AutomationVariable2 - get Automation variable and convert it from CliXml string back to PS object
- Import-VariableFromStorage - download Azure Blob storage XML file and convert it back to the original PowerShell variable
- New-AzureAutomationModule - import new (or update existing) Azure Automation PSH module (including its dependencies)
- Set-AutomationVariable2 - save object as CliXml string to selected Automation variable
- Update-AzureAutomationModule
- functions covering whole life-cycle of Azure Automation Account Runtime feature
    - create/set/remove runtime, import/replace/remove module (custom or default ones)
- ...
'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('Az.Accounts', 
               'Az.Automation', 
               'Az.Resources', 
               'Az.Storage', 
               'CommonStuff')

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
FunctionsToExport = 'Copy-AzureAutomationRuntime', 'Export-VariableToStorage', 
               'Get-AutomationVariable2', 'Get-AzureAutomationRunbookRuntime', 
               'Get-AzureAutomationRunbookTestJobOutput', 
               'Get-AzureAutomationRunbookTestJobStatus', 
               'Get-AzureAutomationRuntime', 
               'Get-AzureAutomationRuntimeAvailableDefaultModule', 
               'Get-AzureAutomationRuntimeCustomModule', 
               'Get-AzureAutomationRuntimeSelectedDefaultModule', 
               'Get-AzureResource', 'Import-VariableFromStorage', 
               'Invoke-AzureAutomationRunbookTestJob', 
               'New-AzureAutomationGraphToken', 'New-AzureAutomationModule', 
               'New-AzureAutomationRuntime', 'New-AzureAutomationRuntimeModule', 
               'Remove-AzureAutomationRuntime', 
               'Remove-AzureAutomationRuntimeModule', 'Set-AutomationVariable2', 
               'Set-AzureAutomationRunbookRuntime', 
               'Set-AzureAutomationRuntimeDefaultModule', 
               'Set-AzureAutomationRuntimeDescription', 
               'Update-AzureAutomationModule', 
               'Update-AzureAutomationRunbookModule'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-AzureAutomationRuntimeAzModule', 'New-AzAutomationModule2', 
               'Set-AzureAutomationModule', 'Set-AzureAutomationRuntimeModule'

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
        Tags = 'Azure','AzureResourceStuff','PowerShell','Monitoring','Audit','Security','Graph','Automation','Runbook','Runtime','Resource'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/ztrhgf/useful_powershell_modules'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
            1.0.0
                Initial release. Some functions are migrated from now deprecated AzureADStuff module, some are completely new.
            1.0.1
                CHANGED
                New-AzureAutomationModule - added support for prerelease modules
            1.0.2
                CHANGED
                New-AzureAutomationModule - removed support for 7.1 runtime because official Az commands don''t support it either
                ADDED
                    Update-AzureAutomationModule
            1.0.3
                ADDED
                    Export-VariableToStorage
                    Import-VariableFromStorage
            1.0.4
                ADDED
                    Get-AutomationVariable2
                    Set-AutomationVariable2
            1.0.5
                CHANGED
                    Added Core PSH support to the module manifest
            1.0.6
                CHANGED
                    Comments
                    URL in module manifest description
            1.0.7
                ADDED
                    Get-AzureAutomationRunbookRuntime
                    Get-AzureAutomationRuntime
                    Get-AzureAutomationRuntimeAvailableDefaultModule
                    Get-AzureAutomationRuntimeCustomModule
                    Get-AzureAutomationRuntimeSelectedDefaultModule
                    New-AzureAutomationGraphToken
                    New-AzureAutomationRuntime
                    Remove-AzureAutomationRuntime
                    Remove-AzureAutomationRuntimeModule
                    Set-AzureAutomationRuntimeDefaultModule
                    Set-AzureAutomationRuntimeDescription
                    Set-AzureAutomationRuntimeModule
                    Set-AzureAutomationRunbookRuntime
            1.0.8
                CHANGED
                    Set-AzureAutomationRuntimeModule renamed to New-AzureAutomationRuntimeModule, added support for autoamtic adding module dependencies
                ADDED
                    Set-AzureAutomationModule alias for New-AzureAutomationModule
            1.0.9
                FIXED
                    module dependencies now contains CommonStuff module (because of Invoke-RestMethod2)

                    New-AzureAutomationModule, New-AzureAutomationRuntimeModule - better process dependencies with specified minimum/maximum version

                    New-AzureAutomationRuntime - better existing runtime detection
                ADDED
                    Copy-AzureAutomationRuntime
                    Update-AzureAutomationRunbookModule
            1.0.10
                FIXED
                    Update-AzureAutomationModule, Update-AzureAutomationRunbookModule, New-AzureAutomationRuntimeModule
            1.0.11
                ADDED
                    Get-AzureAutomationRunbookTestJobOutput
                    Get-AzureAutomationRunbookTestJobStatus
                    Invoke-AzureAutomationRunbookTestJob
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

