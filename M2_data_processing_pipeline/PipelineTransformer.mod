(* M2_data_processing_pipeline/PipelineTransformer.mod *)
MODULE PipelineTransformer;

IMPORT PipelineIngestor;

TYPE
  Record = ARRAY [0..99] OF CHAR;

PROCEDURE Transform(VAR src: PipelineIngestor.DataStream; VAR dst: PipelineIngestor.DataStream);
VAR
  rec: Record;
  tempRec: Record;
  b: BOOLEAN;
  i, len: INTEGER;
  c: CHAR;
BEGIN
  b := PipelineIngestor.GetNext(src, rec);
  WHILE b DO
    len := PipelineIngestor.Strings.StrLen(rec);
    FOR i := 0 TO len-1 DO
      c := rec[i];
      IF (c >= "a") AND (c <= "z") THEN
        tempRec[i] := CHR(ORD(c) - ORD("a") + ORD("A"));
      ELSIF (c >= "A") AND (c <= "Z") THEN
        tempRec[i] := CHR(ORD(c) - ORD("A") + ORD("a"));
      ELSE
        tempRec[i] := c;
      END;
    END;
    PipelineIngestor.AddRecord(dst, tempRec);
    b := PipelineIngestor.GetNext(src, rec);
  END;
END Transform;

BEGIN
END PipelineTransformer.
