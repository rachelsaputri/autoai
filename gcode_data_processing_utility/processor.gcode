( Data Processor Module )
( Version: 1.0.0 )

( O2000: ProcessData )
( Input: #<DATA_LINE> contains the raw data line )
( Output: #<RESULT> contains the processed data line )

( Parse the data line - assuming CSV format: ID,VALUE1,VALUE2 )
#<ID> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 1, ',')
#<VAL1> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 2, ',')
#<VAL2> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 3, ',')

( Convert to floats if needed - using string to float conversion )
#<F_VAL1> = #<STR_TO_FLOAT>(#<VAL1>)
#<F_VAL2> = #<STR_TO_FLOAT>(#<VAL2>)

( Check for conversion errors )
IF [#<F_VAL1> EQ 0 AND #<VAL1> NE "0"]
    #<RESULT> = "ERROR: Invalid VALUE1 for ID #<ID>"
    M99
ENDIF
IF [#<F_VAL2> EQ 0 AND #<VAL2> NE "0"]
    #<RESULT> = "ERROR: Invalid VALUE2 for ID #<ID>"
    M99
ENDIF

( Apply transformation: e.g., scale values by a factor )
#<SCALE_FACTOR> = #<SCALE_FACTOR_VAL>
#<SCALE_FACTOR> = 1.05
#<NEW_VAL1> = #<F_VAL1> * #<SCALE_FACTOR>
#<NEW_VAL2> = #<F_VAL2> * #<SCALE_FACTOR>

( Format output )
#<RESULT> = #<ID> & "," & #<FMT_FLOAT>(#<NEW_VAL1>, 2) & "," & #<FMT_FLOAT>(#<NEW_VAL2>, 2)

M99

( End of processor.gcode )
