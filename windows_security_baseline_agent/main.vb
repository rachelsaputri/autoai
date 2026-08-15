Option Explicit

' Main entry point for the Windows Security Baseline Enforcement Agent

Sub Main()
    ' Initialize components
    Dim config As ConfigManager
    Dim registryScanner As RegistryScanner
    Dim groupPolicyScanner As GroupPolicyScanner
    Dim serviceScanner As ServiceScanner
    Dim remediationEngine As RemediationEngine
    Dim integrationModule As IntegrationModule
    
    Set config = New ConfigManager
    Set registryScanner = New RegistryScanner
    Set groupPolicyScanner = New GroupPolicyScanner
    Set serviceScanner = New ServiceScanner
    Set remediationEngine = New RemediationEngine
    Set integrationModule = New IntegrationModule
    
    ' Load configuration
    config.Load "config.ini"
    
    ' Perform scans
    Dim registryResults As Variant
    Dim groupPolicyResults As Variant
    Dim serviceResults As Variant
    
    registryResults = registryScanner.Scan
    groupPolicyResults = groupPolicyScanner.Scan
    serviceResults = serviceScanner.Scan
    
    ' Analyze results
    Dim complianceReport As ComplianceReport
    Set complianceReport = New ComplianceReport
    
    complianceReport.ProcessResults registryResults, groupPolicyResults, serviceResults
    
    ' Enforce remediation if enabled
    If config.GetSetting("general", "enable_remediation") = "true" Then
        remediationEngine.EnforceRemediation complianceReport
    End If
    
    ' Integrate with audit system
    integrationModule.PushMetrics complianceReport
    integrationModule.LogActions complianceReport
    
    ' Clean up
    Set config = Nothing
    Set registryScanner = Nothing
    Set groupPolicyScanner = Nothing
    Set serviceScanner = Nothing
    Set remediationEngine = Nothing
    Set integrationModule = Nothing
    Set complianceReport = Nothing
    
    MsgBox "Baseline enforcement completed successfully."
End Sub
