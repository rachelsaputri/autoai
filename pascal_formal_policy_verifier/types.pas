unit Types;

{$MODE OBJFPC}{$H+}

interface

uses
  SysUtils, Classes;

type
  TPolicyType = (pt_Require, pt_Prohibit, pt_Optional);

  TPolicy = record
    ID: Integer;
    Name: string;
    PolicyType: TPolicyType;
    Condition: string;
    Action: string;
  end;

  TPolicies = array of TPolicy;

  TInvariant = (Inv_AccessControl, Inv_DataIntegrity, Inv_AuditLogging);
  TInvariants = set of TInvariant;

  TViolation = record
    PolicyID: Integer;
    Invariant: TInvariant;
    Message: string;
  end;

  TReport = record
    PolicyCount: Integer;
    Consistent: Boolean;
    Violations: array of TViolation;
  end;

implementation

end.
