@{
    RootModule        = 'TestModule.psm1'
    ModuleVersion     = '1.1.5'
    GUID              = 'a69f8a7d-33d7-43ee-b45b-195896313942'
    Author            = '@AndrewZtrhgf'
    CompanyName       = 'Unknown'
    Copyright         = '(c) 2022 @AndrewZtrhgf. All rights reserved.'
    Description       = 'Various Intune related functions. Some of them are explained at https://doitpsway.com.

Some of the interesting functions:
- ConvertFrom-MDMDiagReportXML - converts Intune XML report generated by MdmDiagnosticsTool.exe to a PowerShell object
- Get-IntuneLogWin32AppData - gets Intune Win32Apps information from clients log files
- Get-IntuneLogWin32AppReportingResultData - gets Intune Win32Apps results reporting data from clients log files
- Get-IntuneWin32App - shows Win32 apps deployed from Intune to local/remote computer (without connecting to the Intune)
- Get-IntuneLogRemediationScriptData - gets Intune Remediation scripts information from clients log files
- Get-IntuneScriptContent - gets content of the Intune (non-remediation) scripts from the client itself
- Get-ClientIntunePolicyResult - RSOP/gpresult for Intune
- Get-IntuneLog - opens Intune logs (files & system logs)
- Invoke-MDMReenrollment - resets device Intune management connection
- Invoke-IntuneScriptRedeploy - redeploy script deployed from Intune
- Invoke-IntuneWin32AppRedeploy - redeploy application deployed from Intune
- Reset-HybridADJoin - reset Hybrid AzureAD join connection
- Reset-IntuneEnrollment - reset device Intune management enrollment
- Set-AADDeviceExtensionAttribute - set/reset device extension attribute
- Upload-IntuneAutopilotHash - upload given autopilot hash (owner and hostname) into Intune
- ...
'
    PowerShellVersion = '5.1'
    RequiredModules   = @('PSWriteHtml', 'Microsoft.Graph.Intune', 'WindowsAutoPilotIntune', 'CommonStuff', 'AzureRM.Profile')
    FunctionsToExport = '*'
    CmdletsToExport   = '*'
    VariablesToExport = '*'
    AliasesToExport   = '*'
    PrivateData       = @{
        PSData = @{
            Tags       = @('MEMCM', 'PowerShell', 'Intune', 'MDM', 'CommonStuff')
            ProjectUri = 'https://doitpsway.com/series/sccm-mdt-intune'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}