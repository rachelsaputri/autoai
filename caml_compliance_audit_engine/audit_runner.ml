(* Main entry point and workflow orchestration for the Compliance Audit Engine *)

open Printf

module type CONFIG = sig
  val log_path : string
  val policy_path : string
  val output_path : string
end

module type POLICY = sig
  type rule
  val parse : string -> rule list
  val validate : rule -> bool
end

module type REMEDIATION = sig
  type action
  val execute : action -> bool * string
  val rollback : action -> bool * string
end

module AuditEngine (Cfg : CONFIG) (Pol : POLICY) (Rem : REMEDIATION) = struct
  let parse_config () =
    let log_path = Cfg.log_path in
    let policy_path = Cfg.policy_path in
    let output_path = Cfg.output_path in
    (log_path, policy_path, output_path)

  let read_file path =
    let ic = open_in_bin path in
    let content = really_input_string ic (in_channel_length ic) in
    close_in ic;
    content

  let parse_policies path =
    let raw = read_file path in
    let rules = Pol.parse raw in
    let valid_rules = List.filter Pol.validate rules in
    valid_rules

  let parse_logs path =
    let raw = read_file path in
    let lines = String.split_on_char '\\n' raw in
    List.filter (fun l -> l <> "") lines

  let correlate_events (rules : Pol.rule list) (logs : string list) =
    List.map (fun log ->
      let matched_rules = List.filter (fun r -> Pol.validate r) rules in
      (log, matched_rules)
    ) logs

  let generate_verdict events =
    let compliant = List.length events = List.length (List.filter (fun (_, rs) -> List.length rs > 0) events) in
    if compliant then "COMPLIANT" else "NON_COMPLIANT"

  let remediate (verdict : string) (events : (string * Pol.rule list) list) =
    if verdict = "NON_COMPLIANT" then
      let actions = List.map (fun (log, rules) -> (log, List.hd rules)) events in
      List.map (fun (log, rule) ->
        let success, msg = Rem.execute rule in
        (log, success, msg)
      ) actions
    else []

  let run () =
    let log_path, policy_path, output_path = parse_config () in
    let rules = parse_policies policy_path in
    let logs = parse_logs log_path in
    let events = correlate_events rules logs in
    let verdict = generate_verdict events in
    let remediations = remediate verdict events in
    let results = (verdict, remediations) in
    printf "Audit Completed: %s\\n" verdict;
    List.iter (fun (log, success, msg) ->
      if not success then printf "Remediation Failed for %s: %s\\n" log msg
    ) remediations;
    results
end

let main () =
  let module Cfg = struct
    let log_path = "logs/syslog.log"
    let policy_path = "policies/compliance.pol"
    let output_path = "reports/audit.json"
  end in
  let module Pol = struct
    type rule = { id : string; condition : string; severity : int }
    let parse s =
      let lines = String.split_on_char '\\n' s in
      List.map (fun line ->
        let parts = String.split_on_char '|' line in
        { id = List.nth parts 0; condition = List.nth parts 1; severity = int_of_string (List.nth parts 2) }
      ) lines
    let validate r = r.severity >= 0
  end in
  let module Rem = struct
    type action = Pol.rule
    let execute r =
      printf "Executing remediation for rule %s\\n" r.id;
      (true, "Remediation applied successfully")
    let rollback r =
      printf "Rolling back rule %s\\n" r.id;
      (true, "Rollback successful")
  end in
  let module Engine = AuditEngine (Cfg) (Pol) (Rem) in
  Engine.run ()

let _ = main ()
