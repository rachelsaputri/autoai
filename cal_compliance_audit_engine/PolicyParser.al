codeunit 50102 "Policy Parser"
{
    procedure ParsePolicyFile(PolicyPath: Text): Text
    var
        InStream: InStream;
        ConfigText: Text;
        FileExists: Boolean;
    begin
        // In a real Business Central environment, files would be accessed via Azure Blob or similar.
        // For strict functional compliance, we simulate the parsing logic with provided text.
        // The caller is expected to pass the raw configuration string.
        ConfigText := PolicyPath;
        // Basic validation and normalization
        ConfigText := NormalizeWhitespace(ConfigText);
        ConfigText := RemoveComments(ConfigText);
        exit(ConfigText);
    end;

    local procedure NormalizeWhitespace(Input: Text): Text
    var
        Output: Text;
        Chars: List of Text;
        Char: Text;
    begin
        Chars := StringToListChars(Input);
        foreach Char in Chars do
            if Char.Trim() <> '' then
                Output += Char;
        exit(Output);
    end;

    local procedure RemoveComments(Input: Text): Text
    var
        Output: Text;
        Lines: List of Text;
        Line: Text;
    begin
        Lines := StringToList(Input);
        foreach Line in Lines do
            if StrPos(Line, '//') = 0 then
                Output += Line + '<CR><LF>';
        exit(Output);
    end;

    local procedure StringToList(Input: Text): List of Text
    var
        OutputList: List of Text;
        Separator: Text[1];
        Line: Text;
    begin
        Separator := '<CR><LF>';
        while Input.IndexOf(Separator) > 0 do begin
            Line := Input.Substring(1, Input.IndexOf(Separator) - 1);
            OutputList.Add(Line);
            Input := Input.Substring(Input.IndexOf(Separator) + 2);
        end;
        OutputList.Add(Input);
        exit(OutputList);
    end;

    local procedure StringToListChars(Input: Text): List of Text
    var
        OutputList: List of Text;
        i: Integer;
    begin
        for i := 1 to StrLen(Input) do
            OutputList.Add(Input.Substring(i, 1));
        exit(OutputList);
    end;
}
