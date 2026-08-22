( Data Validator Module )
( Version: 1.0.0 )

( O4000: ValidateData )
( Input: #<DATA_LINE> )
( Output: #<IS_VALID> = 1 if valid, 0 if invalid )

( Validation Rules: )
( 1. Check if line has correct number of fields (3 fields: ID, VAL1, VAL2) )
( 2. Check if numeric fields are within expected range )

#<IS_VALID> = 1

( Rule 1: Field count )
#<FIELD_COUNT> = #<COUNT_TOKENS>(#<DATA_LINE>, ',')
IF [#<FIELD_COUNT> NE 3]
    #<IS_VALID> = 0
    M99
ENDIF

( Rule 2: Numeric range )
#<ID> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 1, ',')
#<VAL1_STR> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 2, ',')
#<VAL2_STR> = #<EXTRACT_TOKEN>(#<DATA_LINE>, 3, ',')

( Check if ID is numeric )
#<ID_IS_NUM> = #<CHECK_NUMERIC>(#<ID>)
IF [#<ID_IS_NUM> NE 1]
    #<IS_VALID> = 0
    M99
ENDIF

( Check if VAL1 and VAL2 are numeric and within range [0, 100] )
#<VAL1> = #<STR_TO_FLOAT>(#<VAL1_STR>)
#<VAL2> = #<STR_TO_FLOAT>(#<VAL2_STR>)

IF [#<VAL1> LT 0.0 OR #<VAL1> GT 100.0]
    #<IS_VALID> = 0
    M99
ENDIF

IF [#<VAL2> LT 0.0 OR #<VAL2> GT 100.0]
    #<IS_VALID> = 0
    M99
ENDIF

M99

( End of validator.gcode )
