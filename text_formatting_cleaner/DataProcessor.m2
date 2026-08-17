MODULE DataProc;

IMPORT Types, TextEng, Io, Strings;

PROCEDURE ParseLogLine (
 line: ARRAY OF CHAR
): ARRAY OF CHAR;
VAR
 result: ARRAY 4096 OF CHAR;
 i, keyStart, keyEnd, valStart, valEnd: INTEGER;
 key: ARRAY 256 OF CHAR;
 val: ARRAY 256 OF CHAR;
begin
 result[0] := '\0';
 key[0] := '\0';
 val[0] := '\0';
 
 i := 0;
 WHILE (i < Strings.Strlen(line)) AND (line[i] # ':') DO
 i := i + 1;
 END;
 
 IF i < Strings.Strlen(line) THEN
 keyStart := 0;
 WHILE (keyStart < i) AND (line[keyStart] = " ") DO
 keyStart := keyStart + 1;
 END;
 
 keyEnd := i - 1;
 WHILE (keyEnd > keyStart) AND (line[keyEnd] = " ") DO
 keyEnd := keyEnd - 1;
 END;
 
 Strings.Strncpy(key, line + keyStart, keyEnd - keyStart + 1);
 key[keyEnd - keyStart + 1] := '\0';
 
 valStart := i + 1;
 WHILE (valStart < Strings.Strlen(line)) AND (line[valStart] = " ") DO
 valStart := valStart + 1;
 END;
 
 valEnd := Strings.Strlen(line) - 1;
 WHILE (valEnd >= valStart) AND (line[valEnd] = " ") DO
 valEnd := valEnd - 1;
 END;
 
 IF valEnd >= valStart THEN
 Strings.Strncpy(val, line + valStart, valEnd - valStart + 1);
 val[valEnd - valStart + 1] := '\0';
 
 Strings.Strcpy(result, "\"\"");
 Strings.Strcat(result, key);
 Strings.Strcat(result, "\": "\"");
 Strings.Strcat(result, val);
 Strings.Strcat(result, "\"\",");
 END;
 END;
 
 RETURN result;
END ParseLogLine;

PROCEDURE ExtractStructured (
 input: ARRAY OF CHAR
): ARRAY OF CHAR;
VAR
 result: ARRAY 4096 OF CHAR;
 line: ARRAY 8192 OF CHAR;
 len, i: INTEGER;
 recordLine: ARRAY 4096 OF CHAR;
begin
 result[0] := '\0';
 Strings.Strcpy(result, "key, value\
");
 
 len := Strings.Strlen(input);
 i := 0;
 
 WHILE i < len DO
 line[0] := '\0';
 WHILE (i < len) AND (input[i] # '\n') AND (input[i] # '\r') DO
 line[i] := input[i];
 i := i + 1;
 END;
 line[i] := '\0';
 
 recordLine := ParseLogLine(line);
 IF Strings.Strlen(recordLine) > 0 THEN
 Strings.Strcat(result, recordLine);
 Strings.Strcat(result, "\
");
 END;
 
 IF i < len THEN i := i + 1 END;
 END;
 
 RETURN result;
END ExtractStructured;

PROCEDURE Execute (
 textBuf: Types.TextBuffer;
 mode: Types.ProcessMode
): Types.ProcessResult;
VAR
 input: ARRAY OF CHAR;
 cleaned: ARRAY OF CHAR;
 filtered: ARRAY OF CHAR;
 structured: ARRAY OF CHAR;
 report: ARRAY 1024 OF CHAR;
begin
 input := Types.GetBufferString(textBuf);
 
 cleaned := TextEng.NormalizeLines(input);
 filtered := TextEng.FilterLines(input);
 structured := ExtractStructured(input);
 
 report[0] := '\0';
 CASE mode OF
 | Types.ModeClean:
 Strings.Strcpy(report, "Cleaned lines: "
 Strings.Strcat(report, "\
");
 Io.WriteString(Io.stdOut, cleaned);
 | Types.ModeFilter:
 Strings.Strcpy(report, "Filtered lines: "
 Strings.Strcat(report, "\
");
 Io.WriteString(Io.stdOut, filtered);
 | Types.ModeStructured:
 Strings.Strcpy(report, "Structured records: "
 Strings.Strcat(report, "\
");
 Io.WriteString(Io.stdOut, structured);
 ELSE
 Strings.Strcpy(report, "Unknown mode.\
");
 Io.WriteString(Io.stdOut, cleaned);
 END;
 
 Types.DelTextBuffer(textBuf);
 
 Types.SetReport(report);
 RETURN Types.GetResult();
END Execute;

END DataProc.
