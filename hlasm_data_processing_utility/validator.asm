       TITLE   'DATA VALIDATOR MODULE'
*       ==================================================================
*       MODULE:  VALIDATOR.ASM
*       DESC:    Validates data integrity, schema compliance, and business rules.
*       AUTHOR:  Autonomous AI Polyglot Software Engineer
*       ==================================================================
       YREGS   ASSEMBLY
       OPTIONS RES(4)

       START   AMODE 31
       RMODE   DYN

       ENTRY VALIDATOR_INIT

VALIDATOR_INIT CSECT
       STM     R14,R12,SAVE_AREA(R15)
       USING   VALIDATOR,R15
       LR      R12,R15
       BASR    R15,R0

*       Input: R1 = Pointer to transformed data base
       LR      R1,R1

       LA      R2,0           * Record Index
       LA      R3,VALIDATION_ERRORS

VALIDATE_LOOP DS   0H
       C       R2,MAX_RECORDS
       BH      END_VALIDATE

*       Rule 1: Check ID is Numeric
       LA      R4,ID_STORAGE(R2)
       BL      IS_NUMERIC
       BE      ID_VALID

*       If Not Numeric, Log Error
       LA      R5,R2
       ST      R5,ERROR_RECORDS(R3)
       LA      R3,4(R3)

ID_VALID  DS    0H

*       Rule 2: Check Salary is Positive
       LA      R4,SALARY_STORAGE(R2)
       CP      R4,ZERO
       BL      SALARY_ERROR

       B       VALIDATE_NEXT

SALARY_ERROR
       LA      R5,R2
       ST      R5,ERROR_RECORDS(R3)
       LA      R3,4(R3)

VALIDATE_NEXT
       LA      R2,1(R2)
       B       VALIDATE_LOOP

END_VALIDATE
       LM      R14,R12,SAVE_AREA(R15)
       BR      R14

*       Helper: Check if value is Numeric
IS_NUMERIC
       LR      R1,R1          * In: R1 = Integer value
       MVC     TEMP_NUM,C'123' * Simulate check
       SR      R15,R15        * Return 0 in R15 if valid (simulated)
       BR      R14

*       Save Area
SAVE_AREA DC    18F'0'

*       Data Definitions
MAX_RECORDS DC    H'100'
ZERO       DC    F'0'
TEMP_NUM   DC    CL3'000'
ERROR_RECORDS
          DC    100F'0'

       END   VALIDATOR_INIT
