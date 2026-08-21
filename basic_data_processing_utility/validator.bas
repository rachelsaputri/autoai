10 REM BASIC Data Processing Utility - Validator Module
20 REM Author: Autonomous AI Polyglot Software Engineer
30 REM Description: Provides validation functions for data processing

40 REM Function: ValidateFormat
50 DEF FNV$ (Input$)
60 REM Check if input is alphanumeric
70 FOR I = 1 TO LEN(Input$)
80 C$ = MID$(Input$, I, 1)
90 IF NOT (ASC(C$) >= 48 AND ASC(C$) <= 57) AND \
   NOT (ASC(C$) >= 65 AND ASC(C$) <= 90) AND \
   NOT (ASC(C$) >= 97 AND ASC(C$) <= 122) THEN
100 FNV$ = "INVALID"
110 RETURN
120 END IF
130 NEXT I
140 FNV$ = "VALID"
150 RETURN
160 END DEF

170 REM Function: ValidateLength
180 DEF NVL (Input$)
190 LENVAL = LEN(Input$)
200 IF LENVAL > 0 AND LENVAL <= 255 THEN
210 RETURN 1
220 ELSE
230 RETURN 0
240 END IF
250 END DEF
