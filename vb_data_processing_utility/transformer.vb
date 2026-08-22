Option Explicit

Public Function TransformData(data As Variant) As Variant
    ' Simulate data transformation
    Dim i As Integer
    For i = LBound(data) To UBound(data)
        data(i) = UCase(data(i))
    Next i
    TransformData = data
End Function
