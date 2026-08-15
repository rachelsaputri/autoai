codeunit 50103 "Compliance Audit Main"
{
    procedure RunFullAudit(OriginalConfig: Text; CurrentConfig: Text): Text
    var
        Detector: Codeunit "Drift Detector";
        Engine: Codeunit "Compliance Engine";
        Verdict: Record "Compliance Verdict";
        Certificate: Text;
    begin
        Detector.DetectDrifts(OriginalConfig, CurrentConfig);
        Verdict := Engine.EvaluateCompliance(Detector.GetRegistryContent());
        Certificate := Engine.GenerateComplianceCertificate(Verdict.SystemId);
        exit(Certificate);
    end;
}
