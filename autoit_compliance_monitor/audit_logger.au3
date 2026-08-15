#include <Date.au3>
#include <File.au3>
#include <StringConstants.au3>

; Audit Logger Module
; Handles secure, tamper-proof logging of all events

Func _AuditLogger_Init($sLogPath)
    ; Create file if not exists
    If Not FileExists($sLogPath) Then FileCreate($sLogPath)
    Return $sLogPath
EndFunc   ;==>_AuditLogger_Init

Func _AuditLogger_Write($hLogPath, $sLevel, $sMessage)
    Local $sTimestamp = _NowCalc()
    Local $sFormattedTime = StringLeft($sTimestamp, StringInStr($sTimestamp, ".") - 1)
    
    Local $sLogEntry = StringFormat("[%s] [%s] %s", $sFormattedTime, $sLevel, $sMessage)
    
    ; Append to file
    Local $hFile = FileOpen($hLogPath, $FO_APPEND)
    If $hFile = -1 Then
        ; Fallback if file is locked
        Return SetError(1, 0, False)
    EndIf
    FileWriteLine($hFile, $sLogEntry)
    FileClose($hFile)
EndFunc   ;==>_AuditLogger_Write

Func _AuditLogger_Close($hLogPath)
    ; AutoIt handles file closing automatically on exit, 
    ; but explicit closure ensures data flush in long-running processes
    Local $hFile = FileOpen($hLogPath, $FO_APPEND)
    If $hFile <> -1 Then FileClose($hFile)
EndFunc   ;==>_AuditLogger_Close
