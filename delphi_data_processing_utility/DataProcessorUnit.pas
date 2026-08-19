unit DataProcessorUnit;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  DataTypes;

type
  TDataProcessorEngine = class
  private
    FRecords: TDataList;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadData(const RawData: TArray<string>);
    function Validate: Boolean;
    procedure TransformUpperCase;
    procedure PrintResults;

    property Count: Integer read GetCount;
  end;

implementation

{ TDataProcessorEngine }

constructor TDataProcessorEngine.Create;
begin
  inherited Create;
  FRecords := TDataList.Create;
end;

destructor TDataProcessorEngine.Destroy;
begin
  FRecords.Free;
  inherited Destroy;
end;

procedure TDataProcessorEngine.LoadData(const RawData: TArray<string>);
var
  Item: string;
begin
  FRecords.Clear;
  for Item in RawData do
  begin
    var Rec: TDataRecord;
    Rec.Original := Item;
    Rec.Processed := Item;
    Rec.IsValid := False;
    FRecords.Add(Rec);
  end;
end;

function TDataProcessorEngine.Validate: Boolean;
var
  Rec: TDataRecord;
begin
  Result := True;
  for Rec in FRecords do
  begin
    // Logic: Valid if not empty after trimming
    Rec.IsValid := Trim(Rec.Processed) <> '';
    if not Rec.IsValid then
      Result := False;
  end;
end;

procedure TDataProcessorEngine.TransformUpperCase;
var
  I: Integer;
begin
  for I := 0 to FRecords.Count - 1 do
  begin
    if FRecords[I].IsValid then
      FRecords[I].Processed := Trim(FRecords[I].Processed).ToUpper;
  end;
end;

procedure TDataProcessorEngine.PrintResults;
var
  Rec: TDataRecord;
  I: Integer;
begin
  Writeln('Index | Original          | Processed           | Valid');
  Writeln('----|-------------------|---------------------|------');
  for I := 0 to FRecords.Count - 1 do
  begin
    Rec := FRecords[I];
    Writeln(format('%-5d | %-17s | %-17s | %s', [
      IntToStr(I),
      Rec.Original,
      Rec.Processed,
      if(Rec.IsValid, 'Yes', 'No')
    ]));
  end;
end;

function TDataProcessorEngine.GetCount: Integer;
begin
  Result := FRecords.Count;
end;

end.
