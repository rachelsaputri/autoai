codeunit 50100 "Drift Detector"
{
    var
        DriftRegistry_: Record "Drift Registry";
        ConfigBuffer_: Record "Config Buffer";

    procedure DetectDrifts(OriginalConfig: Text; CurrentConfig: Text): Boolean
    var
        OriginalLines: List of Text;
        CurrentLines: List of Text;
        Line: Text;
        Detected: Boolean;
    begin
        OriginalLines := StringToList(OriginalConfig);
        CurrentLines := StringToList(CurrentConfig);

        Clear(DriftRegistry_);
        if not DriftRegistry_.IsTableOpen() then
            DriftRegistry_.Open();

        foreach Line in OriginalLines do
            if not CurrentLines.Contains(Line) then
            begin
                RegisterDrift('REMoval', Line, '');
                Detected := true;
            end;

        foreach Line in CurrentLines do
            if not OriginalLines.Contains(Line) then
            begin
                RegisterDrift('Addition', '', Line);
                Detected := true;
            end;

        exit(Detected);
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

    local procedure RegisterDrift(DriftType: Text; OriginalValue: Text; CurrentValue: Text)
    begin
        DriftRegistry_.Init();
        DriftRegistry_."Drift Type" := DriftType;
        DriftRegistry_."Original Value" := OriginalValue;
        DriftRegistry_."Current Value" := CurrentValue;
        DriftRegistry_."Detection Timestamp" := CurrentDateTime();
        DriftRegistry_.Insert();
    end;

    procedure GetRegistryContent(): Text
    var
        RegistryContent: Text;
    begin
        if DriftRegistry_.FindSet() then
            repeat
                RegistryContent += Format(DriftRegistry_."Drift Type") + ': ' +
                                   DriftRegistry_."Original Value" + ' vs ' +
                                   DriftRegistry_."Current Value" + '<CR><LF>';
            until DriftRegistry_.Next() = 0;
        exit(RegistryContent);
    end;

    procedure ClearRegistry()
    begin
        if DriftRegistry_.IsTableOpen() then
            DriftRegistry_.DeleteAll();
    end;
}
