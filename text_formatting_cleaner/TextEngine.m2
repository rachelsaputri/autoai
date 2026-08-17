MODULE TextEng;

IMPORT Text, Strings, Files, Types;

CONST
 MaxBufferSize = 1024 * 1024;
 MaxLineLength = 8192;

VAR
 tempBuffer: ARRAY MaxLineLength OF CHAR;

PROCEDURE TrimWhitespace (
 VAR input: ARRAY OF CHAR
): ARRAY OF CHAR;
VAR
 start, endPos, len: INTEGER;
begin
 len := Strings.Strlen(input);
 IF len = 0 THEN RETURN "" END;
 
 start := 0;
 WHILE (start < len) AND (input[start] = " ") DO
 start := start + 1;
 END;
 
 IF start >= len THEN RETURN "" END;
 
 endPos := len - 1;
 WHILE (endPos >= start) AND (input[endPos] = " ") DO
 endPos := endPos - 1;
 END;
 
 Strings.Strncpy(tempBuffer, input + start, endPos - start + 1);
 tempBuffer[endPos - start + 1] := '\0';
 RETURN tempBuffer;
END TrimWhitespace;

PROCEDURE NormalizeLines (
 input: ARRAY OF CHAR
): ARRAY OF CHAR;
VAR
 result: Types.TextBuffer;
 line: ARRAY MaxLineLength OF CHAR;
 lineStart, lineEnd, len, i: INTEGER;
begin
 result := Types.NewTextBuffer();
 len := Strings.Strlen(input);
 
 i := 0;
 WHILE i < len DO
 line[0] := '\0';
 lineStart := i;
 WHILE (i < len) AND (input[i] # '\n') AND (input[i] # '\r') DO
 i := i + 1;
 END;
 lineEnd := i;
 Strings.Strncpy(line, input + lineStart, lineEnd - lineStart);
 line[lineEnd - lineStart] := '\0';
 
 line := TrimWhitespace(line);
 
 IF Strings.Strlen(line) > 0 THEN
 Types.AppendToBuffer(result, line);
 Types.AppendToBuffer(result, "\
");
 END;
 
 IF i < len THEN
 IF input[i] = '\r' THEN i := i + 1 END;
 IF i < len AND input[i] = '\n' THEN i := i + 1 END;
 END;
 END;
 
 RETURN Types.GetBufferString(result);
END NormalizeLines;

PROCEDURE FilterLines (
 input: ARRAY OF CHAR
): ARRAY OF CHAR;
VAR
 result: Types.TextBuffer;
 line: ARRAY MaxLineLength OF CHAR;
 len, i: INTEGER;
trimmed: ARRAY OF CHAR;
begin
 result := Types.NewTextBuffer();
 len := Strings.Strlen(input);
 
 i := 0;
 WHILE i < len DO
 line[0] := '\0';
 WHILE (i < len) AND (input[i] # '\n') AND (input[i] # '\r') DO
 line[i] := input[i];
 i := i + 1;
 END;
 line[i] := '\0';
 
 trimmed := TrimWhitespace(line);
 
 IF Strings.Strlen(trimmed) > 0 THEN
 IF trimmed[0] # '#' THEN
 Types.AppendToBuffer(result, trimmed);
 Types.AppendToBuffer(result, "\
");
 END;
 END;
 
 IF i < len THEN i := i + 1 END;
 END;
 
 RETURN Types.GetBufferString(result);
END FilterLines;

PROCEDURE OpenInputFile (
 path: ARRAY OF CHAR
): Types.TextBuffer;
VAR
 file: Files.File;
 buffer: ARRAY MaxBufferSize OF CHAR;
 len: INTEGER;
 textBuf: Types.TextBuffer;
begin
 file := Files.OpenFile(path, Files.ReadMode);
 IF file = NIL THEN RETURN NIL END;
 
 len := Files.ReadFile(file, buffer, MaxBufferSize - 1);
 Files.CloseFile(file);
 
 IF len = 0 THEN RETURN NIL END;
 buffer[len] := '\0';
 
 textBuf := Types.NewTextBuffer();
 Types.AppendToBuffer(textBuf, buffer);
 RETURN textBuf;
END OpenInputFile;

END TextEng.
