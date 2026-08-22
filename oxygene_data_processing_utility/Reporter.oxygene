namespace oxygene_data_processing_utility;

interface

uses
  System,
  System.Collections.Generic;

type
  Reporter = class
    public
      class method GenerateReport(data: Dictionary<String, String>): String;
      begin
        if data = nil then
          exit 'No data to report.';

        var sb := new StringBuilder();
        sb.AppendLine('=== Data Report ===');
        for key, value in data do
          sb.AppendLine(String.Format('{0}: {1}', key, value));
        sb.AppendLine('===================');

        exit sb.ToString();
      end;
  end;

implementation

end.
