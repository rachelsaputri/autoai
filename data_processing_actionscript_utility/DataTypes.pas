// DataTypes.pas
// Pascal unit for DataProcessor cross-reference (not compiled in AS3)
// Included for documentation purposes

unit DataTypes;

interface

type
	TRecord = record
		Field1: string;
		Field2: string;
		Field3: string;
	end;
	
	TResult = record
		Data: TList;
		Errors: TList;
		Count: Integer;
		ErrorCount: Integer;
	end;

implementation

end.
