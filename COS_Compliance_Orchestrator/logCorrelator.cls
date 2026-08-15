Class COS_Compliance_Orchestrator.logCorrelator Extends (%RegisteredObject)
{

Property LogBuffer As %Library.RichCharStream [Private];
Property CorrelatedEvents As %List [Private];

ClassMethod IngestLogs(pLogData As %String) As %Status
{
    Set tSC = $$$OK
    Try
    {
        Set tLogObj = ##class(%Library.RichCharStream).%New()
        Set tLogObj.SetValue(pLogData)
        Set tSC = tLogObj.Write()
        Set ..LogBuffer = tLogObj
    }
    Catch (tException)
    {
        Set tSC = tException.AsStatus()
    }
    Quit tSC
}

ClassMethod CorrelateEvents() As %Status
{
    Set tSC = $$$OK
    Try
    {
        Set ..CorrelatedEvents = ""
        Set tBuffer = ..LogBuffer
        If tBuffer.IsDefined {
            Set tLineCount = tBuffer.GetLength()
            Set tLine = 1
            While (tLine <= tLineCount) {
                Set tChunk = tBuffer.Read("", 1)
                If $Extract(tChunk, 1) = "[" {
                    Set tEventID = $Extract(tChunk, $Find(tChunk, "]") + 1, *)
                    Set tSource = $Extract(tChunk, $Find(tChunk, "[Source:"), $Find(tChunk, "]") - 1)
                    Set tSeverity = $Extract(tChunk, $Find(tChunk, "[Severity:"), $Find(tChunk, "]") - 1)
                    Set tType = $Extract(tChunk, $Find(tChunk, "[Type:"), $Find(tChunk, "]") - 1)
                    Set tCorrKey = tEventID _ "_" _ tSource _ "_" _ tType
                    Set ..CorrelatedEvents = ..CorrelatedEvents _ $ListBuild(tCorrKey, tSeverity, tEventID)
                }
                Set tLine = tLine + 1
            }
        }
    }
    Catch (tException)
    {
        Set tSC = tException.AsStatus()
    }
    Quit tSC
}

ClassMethod GenerateCorrelationReport(Output pReport As %String) As %Status
{
    Set tSC = $$$OK
    Set tReport = "COMPLIANCE_CORRELATION_REPORT_START\n"
    Set tCount = $ListLength(..CorrelatedEvents)
    Set tReport = tReport _ "Total Correlated Events: " _ tCount _ "\n"
    Set i = 1
    While (i <= tCount) {
        Set tItem = $ListGet(..CorrelatedEvents, i)
        Set tKey = $Piece(tItem, "|", 1)
        Set tSeverity = $Piece(tItem, "|", 2)
        Set tEventID = $Piece(tItem, "|", 3)
        Set tReport = tReport _ "EventID: " _ tEventID _ " | Severity: " _ tSeverity _ " | Key: " _ tKey _ "\n"
        Set i = i + 1
    }
    Set tReport = tReport _ "COMPLIANCE_CORRELATION_REPORT_END\n"
    Set pReport = tReport
    Quit tSC
}

}
