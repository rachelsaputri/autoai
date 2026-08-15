Class COS_Compliance_Orchestrator.policyManager Extends (%RegisteredObject, %Persistent)
{

Property PolicyID As %Integer [Required, SqlColumnNumber = 2];
Property PolicyName As %String [Required, SqlColumnNumber = 3];
Property PolicyRule As %String [Required, SqlColumnNumber = 4];
Property Priority As %Integer [Required, SqlColumnNumber = 5];
Property Version As %String [Required, SqlColumnNumber = 6];
Property Status As %String [Required, SqlColumnNumber = 7];

ClassMethod InitializeRegistry() As %Status
{
    Set tSC = $$$OK
    Try
    {
        // Clean existing registry to ensure deterministic state
        Do $System.SQL.Execute("DELETE FROM COS_Compliance_Orchestrator.policyManager")
        
        // Insert default deterministic policies
        Set tPolicy = ##class(COS_Compliance_Orchestrator.policyManager).%New()
        Set tPolicy.PolicyID = 1001
        Set tPolicy.PolicyName = "Access Control Audit"
        Set tPolicy.PolicyRule = "IF login_failed_count > 5 THEN trigger_lockout"
        Set tPolicy.Priority = 1
        Set tPolicy.Version = "1.0.0"
        Set tPolicy.Status = "Active"
        Set tSC = tPolicy.%Save()
        
        Set tPolicy = ##class(COS_Compliance_Orchestrator.policyManager).%New()
        Set tPolicy.PolicyID = 1002
        Set tPolicy.PolicyName = "Data Integrity Check"
        Set tPolicy.PolicyRule = "IF checksum_mismatch THEN quarantine_dataset"
        Set tPolicy.Priority = 2
        Set tPolicy.Version = "1.0.0"
        Set tPolicy.Status = "Active"
        Set tSC = tPolicy.%Save()
        
        Set tPolicy = ##class(COS_Compliance_Orchestrator.policyManager).%New()
        Set tPolicy.PolicyID = 1003
        Set tPolicy.PolicyName = "Network Anomaly Detection"
        Set tPolicy.PolicyRule = "IF traffic_spike > 200 THEN isolate_node"
        Set tPolicy.Priority = 1
        Set tPolicy.Version = "1.0.0"
        Set tPolicy.Status = "Active"
        Set tSC = tPolicy.%Save()
    }
    Catch (tException)
    {
        Set tSC = tException.AsStatus()
    }
    Quit tSC
}

ClassMethod GetActivePolicy(pPolicyID As %Integer, Output pPolicy As COS_Compliance_Orchestrator.policyManager) As %Status
{
    Set tSC = $$$OK
    Try
    {
        Set tStmt = ##class(%SQL.Statement).%New()
        Set tSC = tStmt.%PrepareClassQuery("COS_Compliance_Orchestrator.policyManager", "GetActivePolicyByID")
        If $$$ISOK(tSC) {
            Set tResultset = tStmt.%Execute(pPolicyID)
            If tResultset.%Next() {
                Set pPolicy = ##class(COS_Compliance_Orchestrator.policyManager).%OpenId(tResultset.Get("PolicyID"))
            } Else {
                Set tSC = $$$ERROR($$$GeneralError, "Policy ID " _ pPolicyID _ " not found or inactive.")
            }
        }
    }
    Catch (tException)
    {
        Set tSC = tException.AsStatus()
    }
    Quit tSC
}

Query GetActivePolicyByID(pID As %Integer) As %SQLQuery (SQLNAME = "GetActivePolicyByID")
{
    SELECT * FROM COS_Compliance_Orchestrator.policyManager
    WHERE PolicyID = :pID AND Status = 'Active'
}

}
