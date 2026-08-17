#Requires AutoHotkey v2.0
#NoEnv
#SingleInstance Force
SetBatchLines -1

; ============================================================================
; CONFIGURATION
; ============================================================================
Config := {
    InputFile: "input_data.csv",
    OutputFile: "output_data.csv",
    LogFile: "processing_report.txt",
    Delimiter: ",",
    TrimFields: True,
    RemoveEmptyRows: True,
    CaseSensitive: False
}

; ============================================================================
; MAIN EXECUTION
; ============================================================================
try {
    if !FileExist(Config.InputFile) {
        MsgBox "Input file not found: " Config.InputFile, "Error", "Timeout:5"
        ExitApp
    }

    Log("Starting Data Processing Utility...")
    StartTime := A_TickCount

    ; 1. Read Data
    Data := ReadAndParseData(Config.InputFile, Config.Delimiter)
    if Data.Length() = 0 {
        Log("Error: Input file is empty or could not be parsed.")
        ExitApp
    }

    ; 2. Sanitize Data
    SanitizedData := SanitizeData(Data, Config)

    ; 3. Transform Data
    TransformedData := TransformData(SanitizedData, Config)

    ; 4. Write Output
    WriteOutputData(TransformedData, Config.OutputFile, Config.Delimiter)

    EndTime := A_TickCount
    Duration := (EndTime - StartTime) / 1000
    Log("Processing Complete.")
    Log("Records Processed: " TransformedData.Length())
    Log("Duration: " Duration " seconds")
    Log("Output saved to: " Config.OutputFile)

    MsgBox "Processing Complete!`nRecords: " TransformedData.Length() "`nDuration: " Duration "s`, "Success", "Timeout:2"
} catch e {
    Log("Critical Error: " e.Message)
    MsgBox "An error occurred: " e.Message, "Fatal Error", "Timeout:5"
}

; ============================================================================
; CORE FUNCTIONS
; ============================================================================

; Reads CSV/TXT and parses into array of objects or arrays
ReadAndParseData(filepath, delimiter) {
    global Config
    FileContent := FileRead(filepath)
    if (FileContent = "") {
        return []
    }

    Lines := StrSplit(FileContent, "`n")
    CleanedLines := []
    for line in Lines {
        ; Remove carriage return if present
        line := RegExReplace(line, "\r", "")
        line := Trim(line)
        if (Config.RemoveEmptyRows && line = "") continue
        CleanedLines.Push(line)
    }

    if (CleanedLines.Length() = 0) return []

    ; Determine if it's CSV by checking the first line for delimiters
    FirstLine := CleanedLines[1]
    if (StrIndexOf(FirstLine, delimiter) > 0) {
        ; Parse as CSV
        Headers := StrSplit(CleanedLines[1], delimiter)
        if (Config.TrimFields) {
            for idx, hdr in Headers {
                Headers[idx] := Trim(hdr)
            }
        }
        
        DataArray := []
        for i := 2 to CleanedLines.Length() {
            Values := StrSplit(CleanedLines[i], delimiter)
            if (Values.Length() < Headers.Length()) {
                ; Pad with empty strings if needed
                while (Values.Length() < Headers.Length()) Values.Push("")
            }
            Record := {}
            for idx, hdr in Headers {
                val := Values[idx] ?? ""
                if (Config.TrimFields) val := Trim(val)
                Record[hdr] := val
            }
            DataArray.Push(Record)
        }
        return DataArray
    } else {
        ; Plain text: treat as single column "Content"
        TextArray := []
        for i := 2 to CleanedLines.Length() {
            val := CleanedLines[i]
            if (Config.TrimFields) val := Trim(val)
            Record := {Content: val}
            TextArray.Push(Record)
        }
        return TextArray
    }
}

; Sanitizes data records
SanitizeData(Data, Config) {
    CleanedData := []
    for idx, record in Data {
        CleanRecord := {}
        for key, value in record {
            ; Remove leading/trailing whitespace
            value := Trim(value)
            ; Replace multiple spaces with single space
            value := RegExReplace(value, " +", " ")
            ; Remove invisible characters (tabs, newlines, etc. except within quoted strings - simplified here)
            value := RegExReplace(value, "[\t\r\n]", " ")
            CleanRecord[key] := value
        }
        if (Config.RemoveEmptyRows) {
            ; Check if the record is effectively empty
            IsEmpty := True
            for k, v in CleanRecord {
                if (v != "") { IsEmpty := False; break }
            }
            if (!IsEmpty) CleanedData.Push(CleanRecord)
        } else {
            CleanedData.Push(CleanRecord)
        }
    }
    return CleanedData
}

; Transforms data based on simple rules
TransformData(Data, Config) {
    TransformedData := []
    for record in Data {
        NewRecord := {}
        for key, value in record {
            ; Example Transformation: Convert "true"/"false" strings to bool-like flags
            if (StrLower(value) = "true") {
                value := "1"
            } else if (StrLower(value) = "false") {
                value := "0"
            }
            
            ; Example Transformation: Trim numeric strings to integers if possible
            if (value ~= "^-?\d+$") {
                value := StrTrim(value, " ") ; Keep as string for CSV compatibility
            }
            
            NewRecord[key] := value
        }
        TransformedData.Push(NewRecord)
    }
    return TransformedData
}

; Writes data to CSV/TXT
WriteOutputData(Data, filepath, delimiter) {
    if (Data.Length() = 0) return

    ; Get headers from the first record
    FirstRecord := Data[1]
    Headers := ObjectToKeyArray(FirstRecord)
    
    OutputLines := []
    OutputLines.Push(StrJoin(Headers, delimiter))
    
    for record in Data {
        RowValues := []
        for header in Headers {
            val := record[header] ?? ""
            ; Escape quotes if necessary (simple CSV escaping)
            if (StrContains(val, delimiter) || StrContains(val, "`"") || StrContains(val, "`n")) {
                val := StrReplace(val, "`"", "`""""")
                val := "`"" val "`""
            }
            RowValues.Push(val)
        }
        OutputLines.Push(StrJoin(RowValues, delimiter))
    }
    
    FileContent := StrJoin(OutputLines, "`n") . "`n"
    FileDelete(filepath)
    FileAppend(FileContent, filepath)
}

; ============================================================================
; UTILITY FUNCTIONS
; ============================================================================

Log(Message) {
    global Config
    try {
        FileAppend(A_Now . " | " Message . "`n", Config.LogFile, "UTF-8")
    } catch e {
        ; Fail silently if log file can't be written
    }
}

ObjectToKeyArray(obj) {
    keys := []
    for k, v in obj {
        keys.Push(k)
    }
    return keys
}

StrJoin(arr, separator) {
    result := ""
    for idx, item in arr {
        if (idx > 1) result .= separator
        result .= item
    }
    return result
}
