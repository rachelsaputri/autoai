MODULE sim_integrity_monitor

IMPORT LibFile, LibString, LibIO

PUBLIC

// Configuration structure
TYPE Config = RECORD
  baselinePath: STRING
  monitorPaths[]: STRING
  logPath: STRING
  checkInterval: LONG
  maxAlerts: LONG
END

// Global configuration
GLOBAL
  cfg: Config
  alertCount: LONG = 0
  baselineHashes: ARRAY OF LONG
  monitoredFiles: ARRAY OF STRING

// Function to compute a simple hash for a file
STATIC FUNC LONG computeFileHash(path: STRING): LONG
  LOCAL fh: LONG, hash: LONG = 0, ch: BYTE
  fh = FileOpen(path, FO_READ)
  IF NOT fh THEN RETURN 0
  WHILE ch = FileRead(fh, 1) > 0
    hash = (hash * 31 + ch) MOD 2147483647
    FileSeek(fh, -1, FS_CURRENT)
  ENDDO
  FileClose(fh)
  RETURN hash
END

// Function to load baseline hashes from a file
STATIC FUNC VOID loadBaseline(path: STRING)
  LOCAL fh: LONG, line: STRING, hash: LONG
  fh = FileOpen(path, FO_READ)
  IF NOT fh THEN Print("Error: Cannot open baseline file."): EXIT
  WHILE line = LineInput(fh)
    IF line == "" CONTINUE
    split(line, ":", 2, line)
    hash = Val(line[1])
    ADD monitoredFiles, line[2]
    ADD baselineHashes, hash
  ENDDO
  FileClose(fh)
END

// Function to check integrity of a single file
STATIC FUNC BOOLEAN checkFileIntegrity(path: STRING, expectedHash: LONG): BOOLEAN
  LOCAL currentHash: LONG
  currentHash = computeFileHash(path)
  IF currentHash != expectedHash THEN
    alertCount++
    Print("[ALERT] Integrity violation detected: " + path + " (Expected: " + Str(expectedHash) + ", Current: " + Str(currentHash) + ")")
    RETURN FALSE
  ENDIF
  RETURN TRUE
END

// Function to detect configuration drift
STATIC FUNC VOID detectDrift()
  LOCAL i: LONG, currentHash: LONG
  FOR i = 0 TO LEN(baselineHashes) - 1
    checkFileIntegrity(monitoredFiles[i], baselineHashes[i])
  NEXT
  IF alertCount > cfg.maxAlerts THEN
    Print("[CRITICAL] Maximum alert threshold exceeded. System lockdown recommended.")
  ENDIF
END

// Function to initialize and run the monitor
PUBLIC FUNC main()
  cfg.baselinePath = "SYS:SystemIntegrity/baseline.dat"
  cfg.monitorPaths[0] = "SYS:Preferences/System.prefs"
  cfg.monitorPaths[1] = "SYS:Startup-Sequence"
  cfg.logPath = "SYS:SystemIntegrity/logs.log"
  cfg.checkInterval = 60
  cfg.maxAlerts = 10
  
  LoadBaseline(cfg.baselinePath)
  
  Print("System Integrity Monitor initialized.")
  Print("Monitoring " + Str(LEN(monitoredFiles)) + " files.")
  
  WHILE TRUE
    DetectDrift()
    Delay(cfg.checkInterval * 60) // Delay in seconds (converted to amiga ticks roughly)
  WEND
END

ENDMODULE
