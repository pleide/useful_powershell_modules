@{
    RootModule        = 'TestModule.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '6c464298-9b3e-478a-996b-e095aaf15c91'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Various Azure related functions focused on authentication etc. More details at https://doitpsway.com/series/azure.
Some of the interesting functions:
- ...
'
    PowerShellVersion = '5.1'
    RequiredModules   = @('Az.Accounts', 'PnP.PowerShell', 'MSAL.PS')
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