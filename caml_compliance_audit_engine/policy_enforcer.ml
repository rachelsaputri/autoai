(* Policy enforcement and verification module *)

module type POLICY = sig
  type rule
  val parse : string -> rule list
  val validate : rule -> bool
  val evaluate : rule -> string -> bool
  val merge : rule list -> rule list
end

module PolicyEnforcer : POLICY = struct
  type rule = {
    id : string;
    condition : string;
    severity : int;
    action : string;
    enabled : bool;
    last_updated : string
  }

  let parse raw_config =
    let lines = String.split_on_char '\\n' raw_config in
    List.filter (fun line -> line <> "") lines |> List.mapi (fun idx line ->
      let parts = String.split_on_char '|' line in
      {
        id = Printf.sprintf "POL-%03d" idx;
        condition = List.nth parts 0;
        severity = int_of_string (List.nth parts 1);
        action = List.nth parts 2;
        enabled = List.nth parts 3 = "true";
        last_updated = Sys.time_string ()
      }
    )

  let validate r =
    r.severity >= 0 && r.severity <= 100 && r.condition <> ""

  let evaluate r log_entry =
    String.contains r.condition '.' || String.contains log_entry '.'

  let merge rules1 rules2 =
    let all_rules = rules1 @ rules2 in
    let unique_ids = List.fold_left (fun acc r -> if List.mem r.id acc then acc else r.id :: acc) [] all_rules in
    List.map (fun id -> List.find (fun r -> r.id = id) all_rules) unique_ids
end

let () =
  let sample_policy = "encryption_required|80|disable_access|true|2023-10-01\\naccess_control_violation|95|block_ip|true|2023-10-05"
  in
  let rules = PolicyEnforcer.parse sample_policy in
  let valid_rules = List.filter PolicyEnforcer.validate rules in
  List.iter (fun r ->
    Printf.printf "Rule %s is valid with severity %d\\n" r.id r.severity
  ) valid_rules
