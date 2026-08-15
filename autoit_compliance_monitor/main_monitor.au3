#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>
#include <StringConstants.au3>
#include <Date.au3>
#include <Array.au3>

; Includes for modular components
#include "registry_watcher.au3"
#include "file_integrity_checker.au3"
#include "process_monitor.au3"
#include "compliance_engine.au3"
#include "audit_logger.au3"
#include "report_generator.au3"

; Global Constants
Global Const $CONFIG_PATH = @ScriptDir & "\compliance_config.ini"
Global Const $LOG_PATH = @ScriptDir & "\audit_logs"
Global Const $REPORT_PATH = @ScriptDir & "\reports"
Global Const $POLICY_VERSION = "1.0.0"
Global $g_bRunning = True
Global $g_hMainGUI

; Main Execution Entry Point
Func Main()
    ; Ensure directories exist
    If Not FileExists($LOG_PATH) Then DirCreate($LOG_PATH)
    If Not FileExists($REPORT_PATH) Then DirCreate($REPORT_PATH)

    ; Initialize Logger
    Local $hLogger = _AuditLogger_Init($LOG_PATH & "\system_integrity.log")
    _AuditLogger_Write($hLogger, "INFO", "AutoIt Compliance Monitor v" & $POLICY_VERSION & " initialized.")

    ; Initialize and Validate Policy
    Local $hPolicy = _ComplianceEngine_InitPolicy($CONFIG_PATH)
    If @Error Then
        _AuditLogger_Write($hLogger, "CRITICAL", "Failed to load or validate policy configuration. Exiting.")
        Exit 1
    EndIf
    _AuditLogger_Write($hLogger, "INFO", "Policy configuration loaded successfully. Version: " & $POLICY_VERSION)

    ; Create Main GUI
    _CreateMainGUI($hLogger)

    ; Initialize Monitors
    Local $hRegWatch = _RegistryWatcher_Init($hLogger)
    Local $hFileCheck = _FileIntegrity_Init($hLogger)
    Local $hProcMon = _ProcessMonitor_Init($hLogger)

    _AuditLogger_Write($hLogger, "INFO", "All monitoring subsystems active. Event loop started.")

    ; Event Loop
    While $g_bRunning
        Sleep(2000) ; Main loop tick

        ; Trigger Checks based on event state or timers (simulated here via polling for simplicity)
        _ComplianceEngine_EvaluateState($hPolicy, $hRegWatch, $hFileCheck, $hProcMon, $hLogger)
    WEnd

    ; Cleanup
    _AuditLogger_Write($hLogger, "INFO", "Monitor shutting down. Generating final report.")
    _ReportGenerator_Generate($REPORT_PATH, $hLogger)
    _AuditLogger_Close($hLogger)
    GUIDelete($g_hMainGUI)
EndFunc   ;==>Main

; Creates the interactive dashboard
Func _CreateMainGUI($hLogger)
    $g_hMainGUI = GUICreate("AutoIt Compliance Monitor Dashboard", 600, 400)
    GUISetState(@SW_SHOW)

    Local $lblStatus = GUICtrlCreateLabel("System Status: Monitoring", 20, 20, 300, 20)
    GUICtrlSetBkColor($lblStatus, $GUI_BKCOLOR_TRANSPARENT)
    GUICtrlSetFont($lblStatus, 10, 800)

    Local $lblUptime = GUICtrlCreateLabel("Uptime: 00:00:00", 20, 50, 200, 20)
    GUICtrlSetBkColor($lblUptime, $GUI_BKCOLOR_TRANSPARENT)

    Local $btnStop = GUICtrlCreateButton("Stop Monitoring", 200, 350, 120, 30)
    Local $btnReport = GUICtrlCreateButton("Generate Report", 350, 350, 120, 30)

    Local $iStart = _NowCalc()

    While $g_bRunning
        Local $iMsg = GUIGetMsg()
        Switch $iMsg
            Case $GUI_EVENT_CLOSE
                $g_bRunning = False
            Case $btnStop
                $g_bRunning = False
                GUICtrlSetData($lblStatus, "System Status: Stopped")
                GUICtrlSetBkColor($lblStatus, 0xFF4444)
            Case $btnReport
                GUICtrlSetData($lblStatus, "Generating Report...")
                _ReportGenerator_Generate($REPORT_PATH, $hLogger)
                GUICtrlSetData($lblStatus, "System Status: Report Generated")
            Case Else
                ; Update Uptime
                Local $iNow = _NowCalc()
                Local $iDiff = _DateDiff('s', $iStart, $iNow)
                GUICtrlSetData($lblUptime, "Uptime: " & _SecToTime($iDiff))
        EndSwitch
        Sleep(100)
    WEnd
EndFunc   ;==>_CreateMainGUI

; Helper to format seconds into HH:MM:SS
Func _SecToTime($iSec)
    Local $iHour = Int($iSec / 3600)
    Local $iMin = Int(Mod($iSec, 3600) / 60)
    Local $iSec_rem = Mod($iSec, 60)
    Return StringFormat("%02d:%02d:%02d", $iHour, $iMin, $iSec_rem)
EndFunc   ;==>_SecToTime

; Run the application
Main()
