unit Consistency_Checker;

{$MODE OBJFPC}{$H+}

interface

uses
  SysUtils, Types;

function CheckConsistency(const Policies: TPolicies): Boolean;

implementation

function CheckConsistency(const Policies: TPolicies): Boolean;
var
  I, J: Integer;
begin
  Result := True;
  // Check for contradictory policies (e.g., one requires and another prohibits the same condition)
  // This is a simplified check
  for I := Low(Policies) to High(Policies) do
  begin
    for J := I + 1 to High(Policies) do
    begin
      // Simple contradiction check: same condition, different types
      if (Policies[I].Condition = Policies[J].Condition) and
         (Policies[I].PolicyType <> Policies[J].PolicyType) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

end.
