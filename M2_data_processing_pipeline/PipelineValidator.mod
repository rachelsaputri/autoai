(* M2_data_processing_pipeline/PipelineValidator.mod *)
MODULE PipelineValidator;

IMPORT PipelineIngestor, STextIO;

TYPE
  Record = ARRAY [0..99] OF CHAR;

PROCEDURE Validate(VAR src: PipelineIngestor.DataStream; VAR validDst: PipelineIngestor.DataStream; VAR invalidDst: PipelineIngestor.DataStream);
VAR
  rec: Record;
  b: BOOLEAN;
  i: INTEGER;
  valid: BOOLEAN;
  c: CHAR;
BEGIN
  b := PipelineIngestor.GetNext(src, rec);
  WHILE b DO
    valid := TRUE;
    (* Check for valid characters *)
    FOR i := 0 TO PipelineIngestor.Strings.StrLen(rec)-1 DO
      c := rec[i];
      IF ((c < "A") OR (c > "Z")) AND ((c < "a") OR (c > "z")) AND (c # "_") AND (c # " ") AND (c # "-") THEN
        valid := FALSE;
      END;
    END;
    IF valid THEN
      PipelineIngestor.AddRecord(validDst, rec);
    ELSE
      PipelineIngestor.AddRecord(invalidDst, rec);
    END;
    b := PipelineIngestor.GetNext(src, rec);
  END;
END Validate;

BEGIN
END PipelineValidator.
