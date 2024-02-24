@{
    RootModule        = 'TestModule.psm1'
    ModuleVersion     = '1.0.3'
    GUID              = '712b70b5-7e0d-4d83-a2e5-68389e890337'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Microsoft Graph API related functions. Some of them are explained at https://doitpsway.com.

Some of the functions:
- Expand-MgAdditionalProperties - Function for expanding "AdditionalProperties" hash property to the main object aka flattens the returned object
- Get-CodeGraphPermissionRequirement - Function for analyzing required Graph API permissions that are needed tu run selected code
- Invoke-GraphAPIRequest - Function for creating request against Microsoft Graph API. Unlike official one supports paging and throttling
- New-GraphAPIAuthHeader - Function for generating header that can be used for authentication of Graph API requests
- ...
'
    PowerShellVersion = '5.1'
    RequiredModules   = @('Az.Accounts', 'MSAL.PS', 'DependencySearch')
    FunctionsToExport = '*'
    CmdletsToExport   = '*'
    VariablesToExport = '*'
    AliasesToExport   = '*'
    PrivateData       = @{
        PSData = @{
            Tags       = @('PowerShell', 'Graph', 'Microsoft', 'API', 'MSGraph', 'MSGraphStuff')
            ProjectUri = 'https://github.com/ztrhgf/useful_powershell_modules'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}