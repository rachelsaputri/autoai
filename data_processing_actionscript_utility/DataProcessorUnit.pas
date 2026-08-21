// DataProcessorUnit.pas
// Pascal unit for DataProcessor cross-reference (not compiled in AS3)
// Included for documentation purposes

unit DataProcessorUnit;

interface

uses
	SysUtils, Classes;

type
	TRecord = record
		Field1: string;
		Field2: string;
		Field3: string;
	end;
	
	TDataProcessor = class
		class function ProcessData(const Data: string; Config: TXMLDocument): TList;
		class function ExportData(Data: TList; Format: string): string;
	end;

implementation

// Implementation omitted - ActionScript implementation is in DataProcessor.as

end.
