unit DataTypes;

interface

uses
  System.Classes;

type
  TDataRecord = record
    Original: string;
    Processed: string;
    IsValid: Boolean;
  end;

  TDataList = TList<TDataRecord>;

implementation

end.
