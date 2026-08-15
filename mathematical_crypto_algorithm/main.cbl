      IDENTIFICATION DIVISION.
      PROGRAM-ID. MATH-CRYPTO-ALGORITHM.
      AUTHOR. ELITE AI.
      DATE-WRITTEN. {DATE}. 

      ENVIRONMENT DIVISION.
      INPUT-OUTPUT SECTION.
      FILE-CONTROL.
          SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
              ORGANIZATION IS LINE SEQUENTIAL.
          SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
              ORGANIZATION IS LINE SEQUENTIAL.

      DATA DIVISION.
      FILE SECTION.
      FD INPUT-FILE.
      01 INPUT-RECORD. 
         05 INPUT-CHAR PIC X(132).
      
      FD OUTPUT-FILE.
      01 OUTPUT-RECORD.
         05 OUTPUT-CHAR PIC X(132).

      WORKING-STORAGE SECTION.
      01 WS-FLAGS.
         05 WS-EOF-FLAG PIC X VALUE 'N'.
         05 WS-KEY-GEN-FLAG PIC X VALUE 'N'.
         05 WS-ENCRYPT-FLAG PIC X VALUE 'N'.
         05 WS-DECRYPT-FLAG PIC X VALUE 'N'.
         
      01 WS-DATAS.
         05 WS-CIPHERTEXT PIC 9(18) VALUE 0.
         05 WS-PLAINTEXT PIC 9(18) VALUE 0.
         05 WS-COMPUTED PIC 9(18) VALUE 0.
         05 WS-RESULT PIC 9(18) VALUE 0.
         05 WS-MODULO PIC 9(18) VALUE 0.
         
      01 WS-PUBLIC-KEY.
         05 WS-N PIC 9(18) VALUE 0.
         05 WS-E PIC 9(18) VALUE 0.
         05 WS-D PIC 9(18) VALUE 0.
         05 WS-P PIC 9(18) VALUE 0.
         05 WS-Q PIC 9(18) VALUE 0.

      01 WS-CONSTANTS.
         05 WS-ONE PIC 9(18) VALUE 1.
         05 WS-TWO PIC 9(18) VALUE 2.
         05 WS-CHAR-CODE PIC 9(18) VALUE 0.

      01 WS-TEMP.
         05 WS-TMP PIC 9(18) VALUE 0.
         05 WS-EXP PIC 9(18) VALUE 0.
         05 WS-BASE PIC 9(18) VALUE 0.
         05 WS-REM PIC 9(18) VALUE 0.
         05 WS-QUOT PIC 9(18) VALUE 0.
         05 WS-B PIC 9(18) VALUE 0.
         05 WS-A PIC 9(18) VALUE 0.

      01 WS-STRING-DATA.
         05 WS-IN-STR PIC X(132) VALUE SPACES.
         05 WS-OUT-STR PIC X(132) VALUE SPACES.
         05 WS-CHAR PIC X.
         05 WS-IDX PIC 9(3) VALUE 0.

      PROCEDURE DIVISION.
      MAIN-PROC.
          MOVE 'MATH-CRYPTO-ALGORITHM' TO OUTPUT-CHAR
          WRITE OUTPUT-RECORD
          DISPLAY 'RSA Key Generation and Encryption Demo'
          PERFORM GENERATE-KEYS
          PERFORM ENCRYPT-DECRYPT-PROCESS
          STOP RUN.

      GENERATE-KEYS.
          DISPLAY 'Generating RSA Key Pair...'
          MOVE 61 TO WS-P
          MOVE 53 TO WS-Q
          COMPUTE WS-N = WS-P * WS-Q
          DISPLAY 'N (Modulus): ' WS-N
          COMPUTE WS-E = (WS-P - WS-TWO) * (WS-Q - WS-TWO)
          COMPUTE WS-E = WS-E - WS-ONE
          DISPLAY 'E (Public Exponent): ' WS-E
          PERFORM FIND-PRIVATE-KEY
          DISPLAY 'D (Private Exponent): ' WS-D
          SET WS-KEY-GEN-FLAG TO 'Y'.

      FIND-PRIVATE-KEY.
          MOVE 0 TO WS-D
          PERFORM UNTIL WS-D > 1
              ADD 1 TO WS-D
              COMPUTE WS-TMP = WS-E * WS-D
              DIVIDE WS-TMP BY WS-E 
                  GIVING WS-QUOT REMAINDER WS-REM
              IF WS-REM = WS-ONE
                  CONTINUE
              ELSE
                  MOVE 0 TO WS-D
          END-PERFORM.
          IF WS-D = 0
              MOVE 1 TO WS-D.

      ENCRYPT-DECRYPT-PROCESS.
          IF WS-KEY-GEN-FLAG = 'Y'
              DISPLAY 'Enter text to encrypt (max 132 chars):'
              ACCEPT WS-IN-STR FROM DISPLAY
              PERFORM ENCRYPT-STRING
              PERFORM DECRYPT-STRING
          ELSE
              DISPLAY 'Keys not generated.'
          END-IF.

      ENCRYPT-STRING.
          DISPLAY 'Encrypting...'
          MOVE SPACES TO WS-OUT-STR
          MOVE 1 TO WS-IDX
          PERFORM VARYING WS-IDX FROM 1 BY 1 
              UNTIL WS-IDX > LENGTH OF WS-IN-STR
              MOVE WS-IN-STR(WS-IDX:1) TO WS-CHAR
              MOVE 0 TO WS-CHAR-CODE
              EVALUATE WS-CHAR
                  WHEN 'A' MOVE 10 TO WS-CHAR-CODE
                  WHEN 'B' MOVE 11 TO WS-CHAR-CODE
                  WHEN 'C' MOVE 12 TO WS-CHAR-CODE
                  WHEN 'D' MOVE 13 TO WS-CHAR-CODE
                  WHEN 'E' MOVE 14 TO WS-CHAR-CODE
                  WHEN 'F' MOVE 15 TO WS-CHAR-CODE
                  WHEN 'G' MOVE 16 TO WS-CHAR-CODE
                  WHEN 'H' MOVE 17 TO WS-CHAR-CODE
                  WHEN 'I' MOVE 18 TO WS-CHAR-CODE
                  WHEN 'J' MOVE 19 TO WS-CHAR-CODE
                  WHEN 'K' MOVE 20 TO WS-CHAR-CODE
                  WHEN 'L' MOVE 21 TO WS-CHAR-CODE
                  WHEN 'M' MOVE 22 TO WS-CHAR-CODE
                  WHEN 'N' MOVE 23 TO WS-CHAR-CODE
                  WHEN 'O' MOVE 24 TO WS-CHAR-CODE
                  WHEN 'P' MOVE 25 TO WS-CHAR-CODE
                  WHEN 'Q' MOVE 26 TO WS-CHAR-CODE
                  WHEN 'R' MOVE 27 TO WS-CHAR-CODE
                  WHEN 'S' MOVE 28 TO WS-CHAR-CODE
                  WHEN 'T' MOVE 29 TO WS-CHAR-CODE
                  WHEN 'U' MOVE 30 TO WS-CHAR-CODE
                  WHEN 'V' MOVE 31 TO WS-CHAR-CODE
                  WHEN 'W' MOVE 32 TO WS-CHAR-CODE
                  WHEN 'X' MOVE 33 TO WS-CHAR-CODE
                  WHEN 'Y' MOVE 34 TO WS-CHAR-CODE
                  WHEN 'Z' MOVE 35 TO WS-CHAR-CODE
                  WHEN ' ' MOVE 36 TO WS-CHAR-CODE
                  WHEN '0' MOVE 37 TO WS-CHAR-CODE
                  WHEN '1' MOVE 38 TO WS-CHAR-CODE
                  WHEN '2' MOVE 39 TO WS-CHAR-CODE
                  WHEN '3' MOVE 40 TO WS-CHAR-CODE
                  WHEN '4' MOVE 41 TO WS-CHAR-CODE
                  WHEN '5' MOVE 42 TO WS-CHAR-CODE
                  WHEN '6' MOVE 43 TO WS-CHAR-CODE
                  WHEN '7' MOVE 44 TO WS-CHAR-CODE
                  WHEN '8' MOVE 45 TO WS-CHAR-CODE
                  WHEN '9' MOVE 46 TO WS-CHAR-CODE
                  WHEN ',' MOVE 47 TO WS-CHAR-CODE
                  WHEN '.' MOVE 48 TO WS-CHAR-CODE
                  WHEN '!' MOVE 49 TO WS-CHAR-CODE
                  WHEN '?' MOVE 50 TO WS-CHAR-CODE
                  WHEN ELSE MOVE 0 TO WS-CHAR-CODE
              END-EVALUATE
              PERFORM ENCRYPT-CHAR
              STRING WS-OUT-STR DELIMITED SIZE 
                  WS-CIPHERTEXT DELIMITED BY SIZE 
                  INTO WS-OUT-STR
          END-PERFORM.
          DISPLAY 'Ciphertext: ' WS-OUT-STR.

      ENCRYPT-CHAR.
          MOVE 0 TO WS-CIPHERTEXT
          MOVE WS-CHAR-CODE TO WS-BASE
          MOVE WS-E TO WS-EXP
          PERFORM EXPONENTIATE.
          COMPUTE WS-CIPHERTEXT = WS-RESULT.

      DECRYPT-STRING.
          DISPLAY 'Decrypting...'
          MOVE SPACES TO WS-IN-STR
          STRING WS-OUT-STR DELIMITED BY SIZE 
              SPACES INTO WS-IN-STR
          MOVE 1 TO WS-IDX
          MOVE SPACES TO WS-OUT-STR
          PERFORM VARYING WS-IDX FROM 1 BY 1 
              UNTIL WS-IDX > LENGTH OF WS-IN-STR
              MOVE 0 TO WS-CHAR-CODE
              STRING WS-IN-STR(WS-IDX:18) DELIMITED BY SIZE 
                  WS-PLAINTEXT DELIMITED BY SIZE 
                  INTO WS-CHAR-CODE
              PERFORM DECRYPT-CHAR
              MOVE WS-CHAR-CODE TO WS-CHAR
              EVALUATE WS-CHAR
                  WHEN 10 MOVE 'A' TO WS-CHAR
                  WHEN 11 MOVE 'B' TO WS-CHAR
                  WHEN 12 MOVE 'C' TO WS-CHAR
                  WHEN 13 MOVE 'D' TO WS-CHAR
                  WHEN 14 MOVE 'E' TO WS-CHAR
                  WHEN 15 MOVE 'F' TO WS-CHAR
                  WHEN 16 MOVE 'G' TO WS-CHAR
                  WHEN 17 MOVE 'H' TO WS-CHAR
                  WHEN 18 MOVE 'I' TO WS-CHAR
                  WHEN 19 MOVE 'J' TO WS-CHAR
                  WHEN 20 MOVE 'K' TO WS-CHAR
                  WHEN 21 MOVE 'L' TO WS-CHAR
                  WHEN 22 MOVE 'M' TO WS-CHAR
                  WHEN 23 MOVE 'N' TO WS-CHAR
                  WHEN 24 MOVE 'O' TO WS-CHAR
                  WHEN 25 MOVE 'P' TO WS-CHAR
                  WHEN 26 MOVE 'Q' TO WS-CHAR
                  WHEN 27 MOVE 'R' TO WS-CHAR
                  WHEN 28 MOVE 'S' TO WS-CHAR
                  WHEN 29 MOVE 'T' TO WS-CHAR
                  WHEN 30 MOVE 'U' TO WS-CHAR
                  WHEN 31 MOVE 'V' TO WS-CHAR
                  WHEN 32 MOVE 'W' TO WS-CHAR
                  WHEN 33 MOVE 'X' TO WS-CHAR
                  WHEN 34 MOVE 'Y' TO WS-CHAR
                  WHEN 35 MOVE 'Z' TO WS-CHAR
                  WHEN 36 MOVE ' ' TO WS-CHAR
                  WHEN 37 MOVE '0' TO WS-CHAR
                  WHEN 38 MOVE '1' TO WS-CHAR
                  WHEN 39 MOVE '2' TO WS-CHAR
                  WHEN 40 MOVE '3' TO WS-CHAR
                  WHEN 41 MOVE '4' TO WS-CHAR
                  WHEN 42 MOVE '5' TO WS-CHAR
                  WHEN 43 MOVE '6' TO WS-CHAR
                  WHEN 44 MOVE '7' TO WS-CHAR
                  WHEN 45 MOVE '8' TO WS-CHAR
                  WHEN 46 MOVE '9' TO WS-CHAR
                  WHEN 47 MOVE ',' TO WS-CHAR
                  WHEN 48 MOVE '.' TO WS-CHAR
                  WHEN 49 MOVE '!' TO WS-CHAR
                  WHEN 50 MOVE '?' TO WS-CHAR
                  WHEN OTHER CONTINUE
              END-EVALUATE
              STRING WS-OUT-STR DELIMITED SIZE 
                  WS-CHAR DELIMITED BY SIZE 
                  INTO WS-OUT-STR
          END-PERFORM.
          DISPLAY 'Plaintext: ' WS-OUT-STR.

      DECRYPT-CHAR.
          MOVE 0 TO WS-PLAINTEXT
          MOVE WS-CIPHERTEXT TO WS-BASE
          MOVE WS-D TO WS-EXP
          PERFORM EXPONENTIATE.
          COMPUTE WS-PLAINTEXT = WS-RESULT.
          COMPUTE WS-CHAR-CODE = WS-PLAINTEXT.

      EXPONENTIATE.
          MOVE 1 TO WS-RESULT
          MOVE WS-BASE TO WS-B
          MOVE WS-EXP TO WS-A
          PERFORM UNTIL WS-A = ZERO
              IF WS-A IS ODD
                  COMPUTE WS-RESULT = WS-RESULT * WS-B
                  DIVIDE WS-RESULT BY WS-N 
                      GIVING WS-QUOT REMAINDER WS-RESULT
              END-IF
              COMPUTE WS-A = WS-A / WS-TWO
              COMPUTE WS-B = WS-B * WS-B
              DIVIDE WS-B BY WS-N 
                  GIVING WS-QUOT REMAINDER WS-B
          END-PERFORM.
