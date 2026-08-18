(* M2_data_processing_pipeline/PipelineReporter.mod *)
MODULE PipelineReporter;

IMPORT PipelineIngestor, STextIO;

TYPE
  Record = ARRAY [0..99] OF CHAR;

PROCEDURE ReportValid(s: PipelineIngestor.DataStream);
VAR
  rec: Record;
  b: BOOLEAN;
BEGIN
  STextIO.WriteString("=== VALID RECORDS ===");
  STextIO.WriteLn;
  b := PipelineIngestor.GetNext(s, rec);
  WHILE b DO
    STextIO.WriteString(rec);
    STextIO.WriteLn;
    b := PipelineIngestor.GetNext(s, rec);
  END;
END ReportValid;

PROCEDURE ReportInvalid(s: PipelineIngestor.DataStream);
VAR
  rec: Record;
  b: BOOLEAN;
BEGIN
  STextIO.WriteString("=== INVALID RECORDS ===");
  STextIO.WriteLn;
  b := PipelineIngestor.GetNext(s, rec);
  WHILE b DO
    STextIO.WriteString(rec);
    STextIO.WriteLn;
    b := PipelineIngestor.GetNext(s, rec);
  END;
END ReportInvalid;

BEGIN
END PipelineReporter.
