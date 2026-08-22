( Data Reporter Module )
( Version: 1.0.0 )

( O5000: GenerateReport )
( Generates a summary report and writes it to the output directory. )

( Input: #<SUCCESS_COUNT>, #<ERROR_COUNT> )
( Output: Report file "output/summary_report.txt" )

#<REPORT_FILE> = #<OUTPUT_DIR> & "summary_report.txt"
#<REPORT_HANDLE> = #<FILE_OPEN>(#<REPORT_FILE>, "W")

( Write header )
#<WRITE>(#<REPORT_HANDLE>, "=== Data Processing Report ===")
#<WRITE>(#<REPORT_HANDLE>, "")
#<WRITE>(#<REPORT_HANDLE>, "Date: [CURRENT_DATE]")
#<WRITE>(#<REPORT_HANDLE>, "")
#<WRITE>(#<REPORT_HANDLE>, "Statistics:")
#<WRITE>(#<REPORT_HANDLE>, "  Total Records Processed: [TOTAL_RECORDS]")
#<WRITE>(#<REPORT_HANDLE>, "  Successful Records: [SUCCESS_COUNT]")
#<WRITE>(#<REPORT_HANDLE>, "  Failed Records: [ERROR_COUNT]")
#<WRITE>(#<REPORT_HANDLE>, "  Success Rate: [SUCCESS_RATE]%")
#<WRITE>(#<REPORT_HANDLE>, "")
#<WRITE>(#<REPORT_HANDLE>, "=== End of Report ===")

#<FILE_CLOSE>(#<REPORT_HANDLE>)

M99

( O6000: LogError )
( Logs error messages to the error log file. )

( Input: #<ERROR_MSG> )

#<ERR_LOG> = #<LOG_DIR> & "errors.log"
#<ERR_HANDLE> = #<FILE_OPEN>(#<ERR_LOG>, "A")
#<WRITE>(#<ERR_HANDLE>, "[TIMESTAMP] " & #<ERROR_MSG>)
#<FILE_CLOSE>(#<ERR_HANDLE>)

M99

( End of reporter.gcode )
