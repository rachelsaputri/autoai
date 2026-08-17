MODULE Main;

IMPORT Text, Io, Files, Strings, TextEng;
IMPORT DataProc, Types;

VAR
 inputPath: ARRAY 256 OF CHAR;
 outputPath: ARRAY 256 OF CHAR;
 mode: Types.ProcessMode;
 status: INTEGER;

PROCEDURE ProcessInput (
 VAR args: ARRAY OF CHAR;
 VAR inPath: ARRAY OF CHAR;
 VAR outPath: ARRAY OF CHAR;
 VAR prMode: Types.ProcessMode
); 
 VAR
 argCount: INTEGER;
 i: INTEGER;
begin
 argCount := Strings.Strlen(args);
 
 inPath[0] := '\0';
 outPath[0] := '\0';
 prMode := Types.ModeClean;
 
 IF argCount = 0 THEN
 Io.WriteString(Io.stdErr, "Usage: Main <input_file> [output_file] [clean|structured|filter]\
");
 RETURN
 END;
 
 i := 0;
 Strings.Strcpy(inPath, args[i]);
 i := i + 1;
 
 IF i < argCount THEN
 Strings.Strcpy(outPath, args[i]);
 i := i + 1;
 END;
 
 IF i < argCount THEN
 IF Strings.Strcmp(args[i], "structured") = 0 THEN
 prMode := Types.ModeStructured;
 ELSIF Strings.Strcmp(args[i], "filter") = 0 THEN
 prMode := Types.ModeFilter;
 ELSE
 prMode := Types.ModeClean;
 END;
 END;
END ProcessInput;

PROCEDURE Run;
VAR
 textBuf: Types.TextBuffer;
 procResult: Types.ProcessResult;
 fileOut: Files.File;
begin
 IF Files.FileExists(inputPath) THEN
 IF Strings.Strlen(inputPath) > 0 THEN
 textBuf := TextEng.OpenInputFile(inputPath);
 IF textBuf # NIL THEN
 procResult := DataProc.Execute(textBuf, mode);
 IF Strings.Strlen(outputPath) > 0 THEN
 fileOut := Files.NewFile(outputPath, Files.WriteMode);
 IF fileOut # NIL THEN
 Io.WriteString(fileOut, procResult.output);
 Io.WriteString(fileOut, "\
");
 END;
 Files.CloseFile(fileOut);
 END;
 
 Io.WriteString(Io.stdOut, "Processing complete. ");
 Io.WriteString(Io.stdOut, procResult.report);
 Io.WriteString(Io.stdOut, "\
");
 END;
 ELSE
 Io.WriteString(Io.stdErr, "Error: Failed to open input file.\
");
 status := 1;
 RETURN
 END;
 END;
 ELSE
 Io.WriteString(Io.stdErr, "Error: Input file not found: "
 Io.WriteString(Io.stdErr, inputPath);
 Io.WriteString(Io.stdErr, "\
");
 status := 1;
 END;
END Run;

BEGIN
 ProcessInput(Args, inputPath, outputPath, mode);
 Run;
END Main.
