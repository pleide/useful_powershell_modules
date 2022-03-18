@{
    RootModule        = 'TestModule.psm1'
    ModuleVersion     = '1.0.1'
    GUID              = '1f9e4f50-2cac-411b-80f8-16003b8a5542'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Various Azure related functions. For example function Get-AzureADAccountOccurrence for getting all account occurrences in you Azure environment.'
    PowerShellVersion = '5.1'
    RequiredModules   = @('Az.Accounts', 'Az.Resources', 'AzureAD', 'MSAL.PS', 'PnP.PowerShell')
    FunctionsToExport = '*'
    CmdletsToExport   = '*'
    VariablesToExport = '*'
    AliasesToExport   = '*'
    PrivateData       = @{
        PSData = @{
            Tags       = @('Azure', 'PowerShell', 'Monitoring', 'Audit', 'Security')
            ProjectUri = 'https://doitpsway.com/how-to-find-all-places-in-azure-where-specific-account-is-used'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}