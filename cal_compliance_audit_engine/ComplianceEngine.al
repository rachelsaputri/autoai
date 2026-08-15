codeunit 50101 "Compliance Engine"
{
    procedure EvaluateCompliance(DriftReport: Text): Record "Compliance Verdict"
    var
        Verdict: Record "Compliance Verdict";
        LineNumber: Integer;
        Line: Text;
        IsCritical: Boolean;
    begin
        Clear(Verdict);
        if not Verdict.IsTableOpen() then
            Verdict.Open();

        Verdict.Init();
        Verdict."Evaluation Timestamp" := CurrentDateTime();
        IsCritical := false;

        LineNumber := 0;
        foreach Line in StringToList(DriftReport) do begin
            LineNumber += 1;
            if StrPos(Line, 'Addition') > 0 then
                if StrPos(Line, 'admin') > 0 then
                    IsCritical := true;
            if StrPos(Line, 'Removal') > 0 then
                if StrPos(Line, 'firewall') > 0 then
                    IsCritical := true;
        end;

        Verdict."Compliance Status" := if IsCritical then 'Non-Compliant' else 'Compliant';
        Verdict."Risk Score" := if IsCritical then 95 else 10;
        Verdict."Verdict Details" := 'Automated evaluation based on critical keywords.';
        Verdict.Insert();
        exit(Verdict);
    end;

    procedure GenerateComplianceCertificate(VerdictId: Guid): Text
    var
        Verdict: Record "Compliance Verdict";
        CertificateText: Text;
    begin
        Verdict.Get(VerdictId);
        CertificateText := 'FORMAL COMPLIANCE CERTIFICATE<CR><LF>';
        CertificateText += 'Status: ' + Verdict."Compliance Status" + '<CR><LF>';
        CertificateText += 'Risk Score: ' + Format(Verdict."Risk Score") + '<CR><LF>';
        CertificateText += 'Timestamp: ' + Format(Verdict."Evaluation Timestamp") + '<CR><LF>';
        CertificateText += 'ID: ' + Format(Verdict.SystemId) + '<CR><LF>';
        CertificateText += 'Verified by Cal Compliance Audit Engine';
        exit(CertificateText);
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
}
