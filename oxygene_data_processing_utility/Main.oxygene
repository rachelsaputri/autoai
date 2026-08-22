namespace oxygene_data_processing_utility;

interface

uses
  System,
  System.Collections.Generic,
  System.IO,
  Validator,
  Transformer,
  Reporter;

type
  Main = class
    public
      class method Main(args: array of String): Integer;
      begin
        var filePath := 'input.csv';
        var data := new Dictionary<String, String>();

        // Example data for demonstration
        data.Add('id', '12345');
        data.Add('name', 'SampleRecord');
        data.Add('status', 'Active');

        Console.WriteLine('Processing Data...');

        // Validate
        var isValid := Validator.Validate(data);
        if not isValid then
        begin
          Console.WriteLine('Validation failed.');
          return 1;
        end;

        // Transform
        var transformedData := Transformer.Transform(data);

        // Report
        var report := Reporter.GenerateReport(transformedData);
        Console.WriteLine(report);

        Console.WriteLine('Processing complete.');
        return 0;
      end;
  end;

implementation

end.
