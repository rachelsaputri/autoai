#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Date.au3>

; Registry Watcher Module
; Manages continuous monitoring of critical registry keys

Global $g_aWatchedKeys[5] = [
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System",
    "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender",
    "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt",
    "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
    "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
]

Global $g_aRegistryValues[5] = ["EnableLUA", "DisableAntiSpyware", "Start", "", ""]

Func _RegistryWatcher_Init($hLogger)
    ; Initialization logic
    ; In a real AutoIt production build, we would use DllCallbackRegister and RegNotifyChangeKeyValue
    ; For this self-contained functional example, we establish the baseline values and return a handle/object simulation
    If $hLogger Then _AuditLogger_Write($hLogger, "INFO", "Registry Watcher initialized with " & UBound($g_aWatchedKeys) & " keys.")
    Return "hRegWatchHandle"
EndFunc   ;==>_RegistryWatcher_Init

Func _RegistryWatcher_Check($hLogger)
    Local $bViolation = False
    Local $sReport = ""

    For $i = 0 To UBound($g_aWatchedKeys) - 1
        Local $sKey = $g_aWatchedKeys[$i]
        Local $sVal = $g_aRegistryValues[$i]
        
        If $sVal = "" Then ContinueLoop ; Skip non-value keys for this simple check

        Local $sCurrentVal = RegRead($sKey, $sVal)
        If @Error Then
            $bViolation = True
            $sReport &= "Failed to read: " & $sKey & "\" & $sVal & @CRLF
            ContinueLoop
        EndIf

        ; Define expected baseline values for compliance
        Local $iExpected
        Switch $i
            Case 0 ; EnableLUA should be 1
                $iExpected = 1
            Case 1 ; DisableAntiSpyware should be 0
                $iExpected = 0
            Case 2 ; Winmgmt Start should be 2 (Auto)
                $iExpected = 2
            Case Else
                ContinueLoop
        EndSwitch

        If String($sCurrentVal) <> String($iExpected) Then
            $bViolation = True
            $sReport &= "COMPLIANCE VIOLATION: " & $sKey & "\" & $sVal & " is " & $sCurrentVal & " (Expected: " & $iExpected & ")" & @CRLF
            If $hLogger Then _AuditLogger_Write($hLogger, "VIOLATION", $sReport)
        EndIf
    Next

    Return $bViolation
EndFunc   ;==>_RegistryWatcher_Check
