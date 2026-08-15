(* Configuration parser and validator for the audit engine *)

module type CONFIG = sig
  val log_path : string
  val policy_path : string
  val output_path : string
  val verbose : bool
end

let parse_config_file path =
  let ic = open_in path in
  let buffer = really_input_string ic (in_channel_length ic) in
  close_in ic;
  let lines = String.split_on_char '\\n' buffer in
  let parse_kv line =
    let parts = String.split_on_char '=' line in
    if List.length parts = 2 then (List.nth parts 0, List.nth parts 1) else ("", "")
  in
  List.map parse_kv lines |> List.filter (fun (k, v) -> k <> "")

let get_config_value (kv_list : (string * string) list) key =
  try
    let _, value = List.find (fun (k, _) -> k = key) kv_list in
    value
  with Not_found -> ""

let load_default_config () =
  let log_path = "logs/syslog.log"
  and policy_path = "policies/compliance.pol"
  and output_path = "reports/audit.json"
  and verbose = false in
  {
    log_path;
    policy_path;
    output_path;
    verbose
  }

let validate_config cfg =
  let valid_paths = cfg.log_path <> "" && cfg.policy_path <> "" && cfg.output_path <> "" in
  if not valid_paths then failwith "Invalid configuration: missing required paths"

let () =
  let cfg = load_default_config () in
  validate_config cfg;
  Printf.printf "Configuration validated successfully.\\n";
  Printf.printf "Log Path: %s\\n" cfg.log_path;
  Printf.printf "Policy Path: %s\\n" cfg.policy_path;
  Printf.printf "Output Path: %s\\n" cfg.output_path
