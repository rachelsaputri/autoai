namespace oxygene_data_processing_utility;

interface

uses
  System,
  System.Collections.Generic;

type
  Transformer = class
    public
      class method Transform(data: Dictionary<String, String>): Dictionary<String, String>;
      begin
        if data = nil then
          exit nil;

        var transformed := new Dictionary<String, String>();

        for key, value in data do
        begin
          var newKey := key.ToUpper();
          var newValue := value.ToUpper();
          transformed.Add(newKey, newValue);
        end;

        exit transformed;
      end;
  end;

implementation

end.
