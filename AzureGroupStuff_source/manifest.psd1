@{
    RootModule        = 'TestModule.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '9520619d-f6f2-4708-bb92-b7ee15391433'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Various Azure related functions focused on group accounts. More details at https://doitpsway.com/series/azure.
Some of the interesting functions:
- Get-AzureGroupMemberRecursive
- Get-AzureGroupSettings
- Set-AzureRingGroup
- ...
'
    PowerShellVersion = '5.1'
    RequiredModules   = @('MSGraphStuff', 'Microsoft.Graph.Authentication', 'Microsoft.Graph.DirectoryObjects', 'Microsoft.Graph.Groups')
    FunctionsToExport = @()
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('Azure', 'PowerShell', 'Monitoring', 'Audit', 'Security', 'Graph', 'Runbook')
            ProjectUri   = 'https://github.com/ztrhgf/useful_powershell_modules'
            ReleaseNotes = '
            * 1.0.0
                * Initial release. Some functions are migrated from now deprecated AzureADStuff module, some are completely new.
            '
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}