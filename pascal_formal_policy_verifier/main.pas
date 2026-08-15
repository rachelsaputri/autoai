program PascalFormalPolicyVerifier;

{$MODE OBJFPC}{$H+}

uses
  SysUtils, Classes, fpjson, jsonparser, policy_parser, consistency_checker, invariant_verifier, report_generator;

var
  PolicyFile: string;
  Policies: TPolicies;
  Invariants: TInvariants;
  Report: TReport;
begin
  if ParamCount < 1 then
  begin
    WriteLn('Usage: PascalFormalPolicyVerifier <policy_file>');
    Halt(1);
  end;

  PolicyFile := ParamStr(1);
  WriteLn('Loading policy from: ', PolicyFile);

  try
    // Parse policies
    Policies := ParsePolicyFile(PolicyFile);
    WriteLn('Policies parsed successfully. Count: ', Length(Policies));

    // Define default invariants for demonstration
    Invariants := [Inv_AccessControl, Inv_DataIntegrity, Inv_AuditLogging];
    WriteLn('Checking against invariants...');

    // Check consistency
    if Not CheckConsistency(Policies) then
    begin
      WriteLn('ERROR: Policies contain logical inconsistencies.');
    end
    else
    begin
      WriteLn('Policies are logically consistent.');
    end;

    // Verify invariants
    Report := VerifyInvariants(Policies, Invariants);
    WriteLn('Verification complete.');

    // Generate report
    GenerateReport(Report, 'verification_report.txt');
    WriteLn('Report generated: verification_report.txt');

  except
    on E: Exception do
    begin
      WriteLn('An error occurred: ', E.Message);
      Halt(1);
    end;
  end;
end.
