** main.prg - Main entry point for FoxPro Data Processing Utility **

PROCEDURE main
    LOCAL lcSourcePath, lcDestinationPath, lcLogFile
    
    * Initialize paths
    lcSourcePath = "C:\\Data\\Input"
    lcDestinationPath = "C:\\Data\\Output"
    lcLogFile = "C:\\Data\\logs\\processing.log"
    
    * Create necessary directories
    CREATE DIRECTORY (lcSourcePath)
    CREATE DIRECTORY (lcDestinationPath)
    CREATE DIRECTORY (PATHOF(0) + "\\logs")
    
    * Initialize logging
    INIT_LOGGING(lcLogFile)
    
    * Display startup message
    ? "FoxPro Data Processing Utility Starting..."
    ? "Source Path: " + lcSourcePath
    ? "Destination Path: " + lcDestinationPath
    
    * Process data files
    PROCESS_DATA_FILES(lcSourcePath, lcDestinationPath)
    
    * Display completion message
    ? "Data processing completed successfully."
    
    * Cleanup
    CLEANUP_LOGGING()
    
    RETURN

PROCEDURE PROCESS_DATA_FILES(tcSourcePath, tcDestinationPath)
    LOCAL lcFile, lcFileName, lnCount
    
    * Get list of files in source directory
    lnCount = ADIR(laFiles, tcSourcePath + "\*.*")
    
    IF lnCount = 0
        ? "No files found in source directory."
        RETURN
    ENDIF
    
    ? "Found " + ALLTRIM(STR(lnCount)) + " files to process."
    
    FOR lnI = 1 TO lnCount
        lcFile = laFiles(lnI, 1)
        lcFileName = JUSTFNAME(lcFile)
        
        * Check file extension
        IF LOWER(JUSTEXT(lcFileName)) = "csv" OR LOWER(JUSTEXT(lcFileName)) = "txt"
            ? "Processing file: " + lcFileName
            PROCESS_SINGLE_FILE(tcSourcePath + "\" + lcFile, tcDestinationPath)
        ELSE
            ? "Skipping non-supported file: " + lcFileName
        ENDIF
    NEXT
    
    RETURN

PROCEDURE PROCESS_SINGLE_FILE(tcSourceFile, tcDestinationPath)
    LOCAL loProcessor
    
    * Create data processor instance
    loProcessor = NEWOBJECT("DataProcessor", HOME() + "ffc\_dataprocessing.prg")
    IF VARTYPE(loProcessor) = "O"
        loProcessor.ProcessFile(tcSourceFile, tcDestinationPath)
        RELEASE OBJECT loProcessor
    ELSE
        ? "Error creating DataProcessor object."
    ENDIF
    
    RETURN
