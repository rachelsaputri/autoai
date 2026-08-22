program DataProcessor;

uses
  System.SysUtils,
  DataProcessorUnit in 'DataProcessorUnit.pas';

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    TDataProcessor.Run;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;
