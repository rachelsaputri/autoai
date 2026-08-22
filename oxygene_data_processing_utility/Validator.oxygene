namespace oxygene_data_processing_utility;

interface

uses
  System,
  System.Collections.Generic;

type
  Validator = class
    public
      class method Validate(data: Dictionary<String, String>): Boolean;
      begin
        if data = nil then
          exit False;

        for key, value in data do
        begin
          if String.IsNullOrEmpty(key) or String.IsNullOrEmpty(value) then
            exit False;
        end;

        exit True;
      end;
  end;

implementation

end.
