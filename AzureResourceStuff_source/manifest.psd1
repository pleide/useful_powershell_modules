@{
    RootModule        = 'AzureResourceStuff.psm1'
    ModuleVersion     = '1.0.6'
    GUID              = '6f9132bb-ec13-43d9-86ea-2bba4017e71e'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Various Azure related functions focused on resources. More details at https://doitpshway.com/series/azure.
Some of the interesting functions:
- Export-VariableToStorage - save PowerShell variable as XML file in Azure Blob storage
- Get-AzureResource - return resources for all or just selected Azure subscription(s)
- Get-AutomationVariable2 - get Automation variable and convert it from CliXml string back to PS object
- Import-VariableFromStorage - download Azure Blob storage XML file and convert it back to the original PowerShell variable
- New-AzureAutomationModule - import new (or update existing) Azure Automation PSH module (including its dependencies)
- Set-AutomationVariable2 - save object as CliXml string to selected Automation variable
- Update-AzureAutomationModule
- ...
'
    PowerShellVersion = '5.1'
    CompatiblePSEditions = 'Core', 'Desktop'
    RequiredModules   = @('Az.Accounts', 'Az.Automation', 'Az.Resources', 'Az.Storage')
    FunctionsToExport = @()
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('Azure', 'AzureResourceStuff', 'PowerShell', 'Monitoring', 'Audit', 'Security', 'Graph', 'Runbook')
            ProjectUri   = 'https://github.com/ztrhgf/useful_powershell_modules'
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
            '
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}