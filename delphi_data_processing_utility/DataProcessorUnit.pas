unit DataProcessorUnit;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.IniFiles, System.IOUtils,
  DataTypes;

type
  TDataProcessor = class
  private
    FData: TDataList;
    FLog: TStringList;
    procedure Log(const AMsg: string);
    procedure IngestFile(const AFilePath: string); overload;
    procedure IngestFile(const AContent: string; const AFormat: TDataFormat);
    procedure TransformData;
    procedure ValidateData;
    procedure ReportResults;
    procedure FreeData;
  public
    constructor Create;
    destructor Destroy; override;
    class procedure Run;
  end;

implementation

{ TDataProcessor }

constructor TDataProcessor.Create;
begin
  inherited Create;
  FData := TDataList.Create;
  FLog := TStringList.Create;
end;

destructor TDataProcessor.Destroy;
begin
  FreeAndNil(FData);
  FreeAndNil(FLog);
  inherited Destroy;
end;

procedure TDataProcessor.Log(const AMsg: string);
begin
  FLog.Add(Format('[%s] %s', [FormatDateTime('yyyy-mm-dd hh:nn:ss', Now), AMsg]));
end;

procedure TDataProcessor.IngestFile(const AFilePath: string);
var
  LContent: string;
  LFileName: string;
  LExt: string;
begin
  if not TFile.Exists(AFilePath) then
    Raise Exception.CreateFmt('File not found: %s', [AFilePath]);

  LContent := TFile.ReadAllText(AFilePath, TEncoding.UTF8);
  LFileName := TPath.GetFileName(AFilePath);
  LExt := TPath.GetExtension(AFilePath).ToLower;

  case LExt of
    '.csv': IngestFile(LContent, dfCSV);
    '.json': IngestFile(LContent, dfJSON);
    '.txt': IngestFile(LContent, dfText);
  else
    Raise Exception.CreateFmt('Unsupported file format: %s', [LExt]);
  end;
end;

procedure TDataProcessor.IngestFile(const AContent: string; const AFormat: TDataFormat);
var
  LRecords: TRecordList;
  I: Integer;
begin
  LRecords := TRecordList.Create;
  try
    case AFormat of
      dfCSV:
        begin
          // Simple CSV parser
          var LLines := TStringList.Create;
          try
            LLines.Text := AContent;
            for I := 1 to LLines.Count - 1 do do // Skip header
              if LLines[I].Trim <> '' then
              begin
                var LFields := TStringList.Create;
                try
                  LFields.Delimiter := ',';
                  LFields.DelimitedText := LLines[I];
                  var LRecord := TDataRecord.Create;
                  try
                    LRecord.ID := StrToIntDef(LFields[0], 0);
                    LRecord.Name := LFields[1];
                    LRecord.Value := StrToFloatDef(LFields[2], 0.0);
                    LRecord.Status := LFields[3];
                    LRecords.Add(LRecord);
                  finally
                    LRecord.Free;
                  end;
                finally
                  LFields.Free;
                end;
              end;
          finally
            LLines.Free;
          end;
        end;
      dfJSON:
        begin
          // Simple JSON parser for array of objects
          var LJSONValue := TJSONObject.ParseJSONValue(AContent);
          try
            if LJSONValue is TJSONArray then
            begin
              var LArray := TJSONArray(LJSONValue);
              for I := 0 to LArray.Count - 1 do
              begin
                var LObj := LArray[I] as TJSONObject;
                var LRecord := TDataRecord.Create;
                try
                  LRecord.ID := LObj.Get('id').GetValue<Integer>;
                  LRecord.Name := LObj.Get('name').GetValue<string>;
                  LRecord.Value := LObj.Get('value').GetValue<Double>;
                  LRecord.Status := LObj.Get('status').GetValue<string>;
                  LRecords.Add(LRecord);
                finally
                  LRecord.Free;
                end;
              end;
            end;
          finally
            LJSONValue.Free;
          end;
        end;
      dfText:
        begin
          // Simple text parser: lines are records, comma-separated
          var LLines := TStringList.Create;
          try
            LLines.Text := AContent;
            for I := 0 to LLines.Count - 1 do
              if LLines[I].Trim <> '' then
              begin
                var LFields := TStringList.Create;
                try
                  LFields.Delimiter := ',';
                  LFields.DelimitedText := LLines[I];
                  var LRecord := TDataRecord.Create;
                  try
                    LRecord.ID := StrToIntDef(LFields[0], 0);
                    LRecord.Name := LFields[1];
                    LRecord.Value := StrToFloatDef(LFields[2], 0.0);
                    LRecord.Status := LFields[3];
                    LRecords.Add(LRecord);
                  finally
                    LRecord.Free;
                  end;
                finally
                  LFields.Free;
                end;
              end;
          finally
            LLines.Free;
          end;
        end;
    end;
    FData.AddRecords(LRecords);
    Log(Format('Ingested %d records from %s format', [LRecords.Count, EnumToStr(TDataFormat, AFormat)]));
  finally
    LRecords.Free;
  end;
end;

procedure TDataProcessor.TransformData;
var
  LRecord: TDataRecord;
begin
  for LRecord in FData do
  begin
    // Example transformation: Normalize Name to UpperCase
    LRecord.Name := LRecord.Name.ToUpper;
    // Example transformation: Flag invalid status
    if LRecord.Status = 'invalid' then
      LRecord.Status := 'flagged';
  end;
  Log('Transformation phase completed.');
end;

procedure TDataProcessor.ValidateData;
var
  LRecord: TDataRecord;
begin
  var LValidCount := 0;
  var LInvalidCount := 0;
  for LRecord in FData do
  begin
    if (LRecord.Name = '') or (LRecord.Value < 0) then
    begin
      LInvalidCount := LInvalidCount + 1;
      Log(Format('Invalid record: ID=%d, Name=%s', [LRecord.ID, LRecord.Name]));
    end
    else
    begin
      LValidCount := LValidCount + 1;
    end;
  end;
  Log(Format('Validation phase completed. Valid: %d, Invalid: %d', [LValidCount, LInvalidCount]));
end;

procedure TDataProcessor.ReportResults;
var
  LTotalValue: Double;
  LRecord: TDataRecord;
begin
  LTotalValue := 0;
  for LRecord in FData do
    LTotalValue := LTotalValue + LRecord.Value;

  Log(Format('Reporting phase completed. Total Value: %.2f, Record Count: %d', [LTotalValue, FData.Count]));
  Writeln('========================================');
  Writeln('PROCESSING REPORT');
  Writeln('========================================');
  Writeln('Total Records Processed: ', FData.Count);
  Writeln('Total Value Sum: ', LTotalValue.ToString('#,##0.00'));
  Writeln('Log Entries:');
  for var LLine in FLog do
    Writeln('  ', LLine);
  Writeln('========================================');
end;

procedure TDataProcessor.FreeData;
begin
  FData.ClearAndFree;
end;

class procedure TDataProcessor.Run;
var
  LProcessor: TDataProcessor;
  LDataDir: string;
  LFiles: TStringDynArray;
  LFile: string;
begin
  LProcessor := TDataProcessor.Create;
  try
    LDataDir := TPath.Combine(TPath.GetLibraryPath, 'data');
    if not TDirectory.Exists(LDataDir) then
    begin
      TDirectory.CreateDirectory(LDataDir);
      // Create sample data
      TFile.WriteAllText(TPath.Combine(LDataDir, 'sample.csv'),
        'ID,Name,Value,Status' + sLineBreak +
        '1,Alice,100.5,active' + sLineBreak +
        '2,Bob,200.0,active' + sLineBreak +
        '3,Charlie,-50.0,invalid');

      TFile.WriteAllText(TPath.Combine(LDataDir, 'sample.json'),
        '[' + sLineBreak +
        '{"id": 4, "name": "David", "value": 150.0, "status": "active"},' + sLineBreak +
        '{"id": 5, "name": "Eve", "value": 300.0, "status": "active"}' + sLineBreak +
        ']');
    end;

    LFiles := TDirectory.GetFiles(LDataDir, '*.csv');
    for LFile in LFiles do
      LProcessor.IngestFile(LFile);

    LFiles := TDirectory.GetFiles(LDataDir, '*.json');
    for LFile in LFiles do
      LProcessor.IngestFile(LFile);

    LProcessor.TransformData;
    LProcessor.ValidateData;
    LProcessor.ReportResults;
  finally
    LProcessor.Free;
  end;
end;

end;
