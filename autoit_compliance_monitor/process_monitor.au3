#include <Array.au3>

; Process Monitor Module
; Tracks running processes against allow/deny lists

Global $g_aAllowedProcesses[5] = ["explorer.exe", "csrss.exe", "svchost.exe", "lsass.exe", "winlogon.exe"]
Global $g_aDeniedProcesses[2] = ["mimikatz.exe", "psexec.exe"]

Func _ProcessMonitor_Init($hLogger)
    If $hLogger Then _AuditLogger_Write($hLogger, "INFO", "Process Monitor initialized.")
    Return "hProcMonHandle"
EndFunc   ;==>_ProcessMonitor_Init

Func _ProcessMonitor_Check($hLogger)
    Local $bViolation = False
    Local $sReport = ""
    Local $aProcesses = ProcessList()

    For $i = 1 To $aProcesses[0][0]
        Local $sProc = $aProcesses[$i][0]
        
        ; Check against denied list
        For $j = 0 To UBound($g_aDeniedProcesses) - 1
            If $sProc = $g_aDeniedProcesses[$j] Then
                $bViolation = True
                $sReport &= "CRITICAL VIOLATION: Denied process running: " & $sProc & @CRLF
                If $hLogger Then _AuditLogger_Write($hLogger, "VIOLATION", $sReport)
                Return $bViolation ; Immediate critical violation
            EndIf
        Next

        ; Note: We don't fail if a process is not in the allowed list, as Windows runs many necessary background services.
        ; Strict allow-listing is often too intrusive for a general monitor without a curated list. 
        ; The denied list check is the primary enforcement mechanism here.
    Next

    Return $bViolation
EndFunc   ;==>_ProcessMonitor_Check
