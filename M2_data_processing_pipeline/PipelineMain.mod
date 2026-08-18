(* M2_data_processing_pipeline/PipelineMain.mod *)
MODULE PipelineMain;

IMPORT STextIO, Strings;
IMPORT PipelineIngestor, PipelineTransformer, PipelineValidator, PipelineReporter;

VAR
  rawStream: PipelineIngestor.DataStream;
  transformedStream: PipelineIngestor.DataStream;
  validStream: PipelineIngestor.DataStream;
  invalidStream: PipelineIngestor.DataStream;

PROCEDURE AddSampleData(VAR s: PipelineIngestor.DataStream);
VAR
  r: PipelineIngestor.Record;
BEGIN
  r := "user_data_01";
  PipelineIngestor.AddRecord(s, r);
  r := "SYSTEM-ADMIN";
  PipelineIngestor.AddRecord(s, r);
  r := "invalid@data!";
  PipelineIngestor.AddRecord(s, r);
  r := "config_value";
  PipelineIngestor.AddRecord(s, r);
  r := "BAD DATA!";
  PipelineIngestor.AddRecord(s, r);
END AddSampleData;

BEGIN
  PipelineIngestor.InitStream(rawStream);
  AddSampleData(rawStream);
  
  PipelineIngestor.InitStream(transformedStream);
  PipelineTransformer.Transform(rawStream, transformedStream);
  
  PipelineIngestor.InitStream(validStream);
  PipelineIngestor.InitStream(invalidStream);
  PipelineValidator.Validate(transformedStream, validStream, invalidStream);
  
  STextIO.WriteString("Processing Pipeline Output:");
  STextIO.WriteLn;
  
  PipelineReporter.ReportValid(validStream);
  PipelineReporter.ReportInvalid(invalidStream);
  
  STextIO.WriteString("Done.");
  STextIO.WriteLn;
  STextIO.FlushOutput;
END PipelineMain.
