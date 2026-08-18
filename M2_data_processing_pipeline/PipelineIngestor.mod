(* M2_data_processing_pipeline/PipelineIngestor.mod *)
MODULE PipelineIngestor;

IMPORT STextIO, SD2IO, Strings;

TYPE
  Record = ARRAY [0..99] OF CHAR;
  DataStream = POINTER TO DataBuffer;
  DataBuffer = RECORD
    buffer: ARRAY [0..99] OF CHAR;
    len: INTEGER;
    next: DataStream;
  END;

VAR
  stream: DataStream;

PROCEDURE InitStream(VAR s: DataStream);
BEGIN
  NEW(s);
  s.buffer := "";
  s.len := 0;
  s.next := NIL;
END InitStream;

PROCEDURE AddRecord(VAR s: DataStream; rec: Record);
VAR
  temp: DataStream;
BEGIN
  IF s = NIL THEN
    InitStream(s);
  ELSE
    temp := s;
    WHILE temp.next # NIL DO
      temp := temp.next;
    END;
    NEW(temp.next);
    temp := temp.next;
  END;
  Strings.StrCopy(temp.buffer, rec);
  temp.len := Strings.Length(rec);
  temp.next := NIL;
END AddRecord;

PROCEDURE GetNext(VAR s: DataStream; VAR rec: Record): BOOLEAN;
BEGIN
  IF s # NIL THEN
    Strings.StrCopy(rec, s.buffer);
    s := s.next;
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END;
END GetNext;

PROCEDURE PrintStream(s: DataStream);
VAR
  rec: Record;
  b: BOOLEAN;
BEGIN
  b := GetNext(s, rec);
  WHILE b DO
    STextIO.WriteLn;
    STextIO.WriteString(rec);
    b := GetNext(s, rec);
  END;
END PrintStream;

BEGIN
END PipelineIngestor.
