#
# Module manifest for module 'AzureADStuff'
#
# Generated by: @AndrewZtrhgf
#
# Generated on: 25.03.2022
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'AzureADStuff.psm1'

# Version number of this module.
ModuleVersion = '1.0.4'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '1f9e4f50-2cac-411b-80f8-16003b8a5542'

# Author of this module
Author = '@AndrewZtrhgf'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2022 @AndrewZtrhgf. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Various Azure related functions. Some of them are explained at https://doitpsway.com.

Some of the functions:
- Get-AzureADAccountOccurrence - for getting all account occurrences in your Azure environment
- Get-AzureADAppConsentRequest - for getting all application admin consent requests
- Get-AzureDevOpsOrganizationOverview - list of all DevOps organizations
- Add-AzureADAppCertificate - add the certificate (existing or create self-signed) to selected Azure application as an secret

Some of the authentication-related functions:
- New-AzureDevOpsAuthHeader
- New-GraphAPIAuthHeader'

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
               'Az.Resources', 
               'AzureAD', 
               'MSAL.PS', 
               'PnP.PowerShell')

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
FunctionsToExport = 'Add-AzureADAppCertificate', 'Connect-AzAccount2', 'Connect-AzureAD2', 
               'Connect-PnPOnline2', 'Get-AzureADAccountOccurrence', 
               'Get-AzureADAppConsentRequest', 'Get-AzureADRoleAssignments', 
               'Get-AzureDevOpsOrganizationOverview', 'Get-SharepointSiteOwner', 
               'Invoke-GraphAPIRequest', 'New-AzureDevOpsAuthHeader', 
               'New-GraphAPIAuthHeader', 'Open-AzureADAdminConsentPage'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-AzureADIAMRoleAssignments', 'Get-AzureADRBACRoleAssignments', 
               'Get-IntuneAuthHeader', 'New-IntuneAuthHeader'

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
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

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

