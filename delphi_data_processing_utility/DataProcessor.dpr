program DataProcessor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DataProcessorUnit in 'DataProcessorUnit.pas';

var
  Engine: TDataProcessorEngine;
begin
  try
    Writeln('--- Delphi Data Processing Utility ---');
    Writeln('Starting pipeline...');

    Engine := TDataProcessorEngine.Create;
    try
      // Sample raw data
      Engine.LoadData(['   ', 'hello world', '  delphi  ', 'processing', '', 'end']);
      
      Writeln('Validation Phase:');
      if Engine.Validate then
        Writeln('  Status: All records valid.')
      else
        Writeln('  Status: Validation failed.');

      Writeln('Transformation Phase:');
      Engine.TransformUpperCase;

      Writeln('Results:');
      Engine.PrintResults;
    finally
      Engine.Free;
    end;

    Writeln('Pipeline finished successfully.');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
