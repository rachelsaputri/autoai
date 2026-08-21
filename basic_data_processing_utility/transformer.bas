10 REM BASIC Data Processing Utility - Transformer Module
20 REM Author: Autonomous AI Polyglot Software Engineer
30 REM Description: Provides transformation functions for data processing

40 REM Function: ToUpperCase
50 DEF TU$ (Input$)
60 Output$ = ""
70 FOR I = 1 TO LEN(Input$)
80 C$ = MID$(Input$, I, 1)
90 IF ASC(C$) >= 97 AND ASC(C$) <= 122 THEN
100 Output$ = Output$ + CHR$(ASC(C$) - 32)
110 ELSE
120 Output$ = Output$ + C$
130 END IF
140 NEXT I
150 TU$ = Output$
160 RETURN
170 END DEF

180 REM Function: SanitizeInput
190 DEF SI$ (Input$)
200 REM Replace spaces with underscores
210 Output$ = ""
220 FOR I = 1 TO LEN(Input$)
230 C$ = MID$(Input$, I, 1)
240 IF C$ = " " THEN
250 Output$ = Output$ + "_"
260 ELSE
270 Output$ = Output$ + C$
280 END IF
290 NEXT I
300 SI$ = Output$
310 RETURN
320 END DEF
