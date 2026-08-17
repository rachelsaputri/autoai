MODULE Types;

IMPORT Text, Strings, Files, Io;

CONST
 ModeClean = 0;
 ModeFilter = 1;
 ModeStructured = 2;

TYPE
 TextBuffer = POINTER TO TextBufferRec;
 TextBufferRec = RECORD
 content: ARRAY 1048576 OF CHAR;
 length: INTEGER;
 END;
 
 ProcessResult = RECORD
 output: ARRAY 1048576 OF CHAR;
 report: ARRAY 1024 OF CHAR;
 END;
 
 ProcessMode = (ModeClean, ModeFilter, ModeStructured);
 
VAR
 globalReport: ARRAY 1024 OF CHAR;

PROCEDURE NewTextBuffer (): TextBuffer;
VAR
 buf: TextBuffer;
begin
 NEW(buf);
 buf.content[0] := '\0';
 buf.length := 0;
 RETURN buf;
END NewTextBuffer;

PROCEDURE DelTextBuffer (buf: TextBuffer);
BEGIN
 DISPOSE(buf);
END DelTextBuffer;

PROCEDURE AppendToBuffer (
 VAR buf: TextBuffer;
 text: ARRAY OF CHAR
);
VAR
 textLen, i, j: INTEGER;
begin
 textLen := Strings.Strlen(text);
 IF (buf.length + textLen) >= LEN(buf.content) THEN RETURN END;
 
 j := buf.length;
 FOR i := 0 TO textLen - 1 DO
 buf.content[j] := text[i];
 j := j + 1;
 END;
 
 buf.content[j] := '\0';
 buf.length := j;
END AppendToBuffer;

PROCEDURE GetBufferString (buf: TextBuffer): ARRAY OF CHAR;
VAR
 i: INTEGER;
begin
 FOR i := 0 TO buf.length - 1 DO
 IF buf.content[i] = '\0' THEN buf.content[i] := ' ' END;
 END;
 RETURN buf.content;
END GetBufferString;

PROCEDURE GetResult (): ProcessResult;
VAR
 res: ProcessResult;
BEGIN
 res.report := globalReport;
 RETURN res;
END GetResult;

PROCEDURE SetReport (rpt: ARRAY OF CHAR);
BEGIN
 globalReport := rpt;
END SetReport;

END Types.
