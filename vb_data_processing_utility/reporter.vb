Option Explicit

Public Sub GenerateReport(data As Variant)
    ' Simulate report generation
    MsgBox "Report generated with " & UBound(data) - LBound(data) + 1 & " records."
End Sub
