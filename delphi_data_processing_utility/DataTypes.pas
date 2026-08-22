unit DataTypes;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TDataFormat = (dfCSV, dfJSON, dfText);

  TDataRecord = class
  private
    FID: Integer;
    FName: string;
    FValue: Double;
    FStatus: string;
  public
    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
    property Value: Double read FValue write FValue;
    property Status: string read FStatus write FStatus;
  end;

  TDataList = class
  private
    FItems: TObjectList<TDataRecord>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddRecord(const ARecord: TDataRecord);
    procedure AddRecords(const ARecords: TObjectList<TDataRecord>);
    procedure ClearAndFree;
    property Items: TObjectList<TDataRecord> read FItems;
    property Count: Integer read FItems.Count;
    property RecordByIndex[I: Integer]: TDataRecord read FItems.Items[I]; default;
  end;

function EnumToStr<T>(AEnum: T): string;

implementation

function EnumToStr<T>(AEnum: T): string;
begin
  Result := System.TypeInfo.GetEnumName(System.TypeInfo.TypeInfo(T), System.TypeInfo.GetEnumValue(AEnum));
end;

{ TDataList }

constructor TDataList.Create;
begin
  inherited Create;
  FItems := TObjectList<TDataRecord>.Create(True); // Owns objects
end;

destructor TDataList.Destroy;
begin
  ClearAndFree;
  inherited Destroy;
end;

procedure TDataList.AddRecord(const ARecord: TDataRecord);
begin
  FItems.Add(ARecord);
end;

procedure TDataList.AddRecords(const ARecords: TObjectList<TDataRecord>);
var
  LRecord: TDataRecord;
begin
  for LRecord in ARecords do
    FItems.Add(LRecord);
end;

procedure TDataList.ClearAndFree;
begin
  FItems.Clear; // Clears and frees due to OwnsObjects=True
end;

end;
