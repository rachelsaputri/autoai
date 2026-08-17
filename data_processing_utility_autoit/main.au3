#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <CSV.au3>
#include <JSON.au3>

#include "lib\dataProcessor.au3"
#include "lib\jsonProcessor.au3"
#include "lib\textSanitizer.au3"
#include "lib\statisticsCalculator.au3"

Global $g_sConfigFile = "config.ini"
Global $g_sInputDir = "input"
Global $g_sOutputDir = "output"
Global $g_bShowGUI = False

; Parse command line arguments
Local $sArg = ""
For $i = 1 To $CmdLine[0]
    If $CmdLine[$i] = "-gui" Or $CmdLine[$i] = "/gui" Then
        $g_bShowGUI = True
    EndIf
    If StringLeft($CmdLine[$i], 4) = "-cfg" And StringLen($CmdLine[$i]) > 4 Then
        $g_sConfigFile = StringTrimLeft($CmdLine[$i], 4)
    EndIf
    If StringLeft($CmdLine[$i], 4) = "-in " And StringLen($CmdLine[$i]) > 4 Then
        $g_sInputDir = StringTrimLeft($CmdLine[$i], 4)
    EndIf
    If StringLeft($CmdLine[$i], 4) = "-out" And StringLen($CmdLine[$i]) > 4 Then
        $g_sOutputDir = StringTrimLeft($CmdLine[$i], 4)
    EndIf
Next

; Read configuration
ReadConfiguration()

; Ensure directories exist
DirCreate($g_sInputDir)
DirCreate($g_sOutputDir)

If $g_bShowGUI Then
    RunGUI()
Else
    RunCLI()
EndIf

Func RunCLI()
    ConsoleWrite("=== AutoIt Data Processing Utility ===" & @CRLF)
    ConsoleWrite("Input Directory: " & $g_sInputDir & @CRLF)
    ConsoleWrite("Output Directory: " & $g_sOutputDir & @CRLF)
    
    Local $aFiles = _FileListToArray($g_sInputDir, "*.csv", 1)
    If @error Then
        ConsoleWrite("No CSV files found in input directory." & @CRLF)
        Return
    EndIf
    
    For $i = 1 To $aFiles[0]
        Local $sFile = $aFiles[$i]
        ConsoleWrite("Processing file: " & $sFile & @CRLF)
        
        Local $sFilePath = $g_sInputDir & "\" & $sFile
        Local $aData = FileReadToArray($sFilePath)
        If @error Then
            ConsoleWrite("Error reading file: " & $sFile & @CRLF)
            ContinueLoop
        EndIf
        
        ; Process data
        Local $sProcessed = ProcessData($aData)
        
        ; Write output
        Local $sOutFile = $g_sOutputDir & "\processed_" & $sFile
        Local $hFile = FileOpen($sOutFile, $FO_OVERWRITE + $FO_UTF8_NOBOM)
        If $hFile = -1 Then
            ConsoleWrite("Error creating output file: " & $sOutFile & @CRLF)
            ContinueLoop
        EndIf
        FileWrite($hFile, $sProcessed)
        FileClose($hFile)
        ConsoleWrite("Output written to: " & $sOutFile & @CRLF)
    Next
    
    ConsoleWrite("Processing complete." & @CRLF)
EndFunc

Func ProcessData($aData)
    Local $sResult = ""
    
    ; Sanitize text
    $sResult = TextSanitize($aData)
    
    ; Calculate statistics
    Local $aStats = CalculateStatistics($aData)
    
    ; Combine results
    $sResult &= @CRLF & "=== Statistics ===" & @CRLF
    For $i = 0 To UBound($aStats) - 1
        $sResult &= $aStats[$i] & @CRLF
    Next
    
    Return $sResult
EndFunc

Func RunGUI()
    Local $hGUI = GUICreate("AutoIt Data Processing Utility", 600, 400)
    
    Local $idInputDir = GUICtrlCreateInput($g_sInputDir, 10, 20, 400, 20)
    GUICtrlCreateLabel("Input Directory:", 10, 5, 100, 20)
    
    Local $idOutputDir = GUICtrlCreateInput($g_sOutputDir, 10, 50, 400, 20)
    GUICtrlCreateLabel("Output Directory:", 10, 35, 100, 20)
    
    Local $idProcess = GUICtrlCreateButton("Process Files", 10, 80, 150, 30)
    Local $idLog = GUICtrlCreateEdit("", 10, 120, 580, 200, $ES_READONLY)
    Local $idStatus = GUICtrlCreateLabel("Ready", 10, 330, 580, 20)
    
    GUISetState(@SW_SHOW)
    
    While 1
        Local $nMsg = GUIGetMsg()
        Switch $nMsg
            Case $GUI_EVENT_CLOSE
                ExitLoop
            Case $idProcess
                $g_sInputDir = GUICtrlRead($idInputDir)
                $g_sOutputDir = GUICtrlRead($idOutputDir)
                GUICtrlSetData($idLog, "Processing..." & @CRLF)
                GUICtrlSetState($idProcess, $GUI_DISABLE)
                
                Local $aFiles = _FileListToArray($g_sInputDir, "*.csv", 1)
                If @error Then
                    GUICtrlSetData($idLog, "No CSV files found in input directory." & @CRLF)
                Else
                    For $i = 1 To $aFiles[0]
                        Local $sFile = $aFiles[$i]
                        GUICtrlSetData($idLog, "Processing: " & $sFile & @CRLF, 1)
                        Local $sFilePath = $g_sInputDir & "\" & $sFile
                        Local $aData = FileReadToArray($sFilePath)
                        If @error Then
                            GUICtrlSetData($idLog, "Error reading: " & $sFile & @CRLF, 1)
                            ContinueLoop
                        EndIf
                        
                        Local $sProcessed = ProcessData($aData)
                        Local $sOutFile = $g_sOutputDir & "\processed_" & $sFile
                        Local $hFile = FileOpen($sOutFile, $FO_OVERWRITE + $FO_UTF8_NOBOM)
                        If $hFile = -1 Then
                            GUICtrlSetData($idLog, "Error creating output: " & $sOutFile & @CRLF, 1)
                        Else
                            FileWrite($hFile, $sProcessed)
                            FileClose($hFile)
                            GUICtrlSetData($idLog, "Output: " & $sOutFile & @CRLF, 1)
                        EndIf
                    Next
                EndIf
                
                GUICtrlSetData($idLog, "Processing complete." & @CRLF)
                GUICtrlSetState($idProcess, $GUI_ENABLE)
                GUICtrlSetData($idStatus, "Complete")
        EndSwitch
    WEnd
    
    GUIDelete($hGUI)
EndFunc

Func ReadConfiguration()
    If FileExists($g_sConfigFile) Then
        $g_sInputDir = IniRead($g_sConfigFile, "Paths", "InputDir", $g_sInputDir)
        $g_sOutputDir = IniRead($g_sConfigFile, "Paths", "OutputDir", $g_sOutputDir)
    EndIf
EndFunc

Func ProcessData($aData)
    Local $sResult = ""
    
    ; Sanitize text
    $sResult = TextSanitize($aData)
    
    ; Calculate statistics
    Local $aStats = CalculateStatistics($aData)
    
    ; Combine results
    $sResult &= @CRLF & "=== Statistics ===" & @CRLF
    For $i = 0 To UBound($aStats) - 1
        $sResult &= $aStats[$i] & @CRLF
    Next
    
    Return $sResult
EndFunc
