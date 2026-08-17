open Yojson.Basic.Util

(* Types for the DPU *)

(** Represents a row in a dataset. *)
type row = string list

(** Represents the full dataset. *)
type dataset = {
  headers : string list ;
  rows : row list ;
} ;;

(** Represents a validation rule. *)
type validation_rule =
  | Regex of string
  | Length of int * int
  | Range of float * float
  | Required ;;

(** Represents a schema for validation. *)
type schema = {
  fields : (string * validation_rule list) list ;
} ;;

(** Represents a transformation rule. *)
type transform_rule =
  | Trim
  | ToLowercase
  | ToUppercase
  | Convert of string * string ;;

(* Parsing functions *)

(** Parse a CSV string into a dataset. *)
let parse_csv content =
  let lines = Str.split (Str.regexp "\\n") content in
  let headers = List.hd lines |> Str.split (Str.regexp ",") |> List.map String.trim in
  let rows = List.tl lines |> List.filter (fun line -> line <> "") |> List.map (fun line ->
    Str.split (Str.regexp ",") line |> List.map String.trim
  ) in
  { headers; rows }

(** Parse a JSON string into a dataset. *)
let parse_json content =
  let json = Yojson.Basic.from_string content in
  match json with
  | `Assoc ["headers", `List h; "rows", `List r] ->
      let headers = h |> List.map (function `String s -> s | _ -> "unknown") in
      let rows = r |> List.map (function
        | `List fields -> fields |> List.map (function `String s -> s | _ -> "")
        | _ -> []
      ) in
      { headers; rows }
  | _ ->
      { headers = []; rows = [] }

(** Parse a text file into a list of lines. *)
let parse_text content =
  content |> Str.split (Str.regexp "\\n") |> List.filter (fun line -> line <> "")

(* Transformation functions *)

(** Apply a single transformation rule to a list of strings. *)
let apply_transform_rule row rule =
  match rule with
  | Trim -> List.map String.trim row
  | ToLowercase -> List.map String.lowercase_ascii row
  | ToUppercase -> List.map String.uppercase_ascii row
  | Convert (from, to_) ->
      List.map (fun s ->
        let len_from = String.length from in
        let len_to = String.length to_ in
        if len_from = len_to then
          let b = Buffer.create len_from in
          let i = ref 0 in
          while !i < len_from do
            if s.[!i] = from.[!i] then Buffer.add_char b to_.[!i]
            else Buffer.add_char b s.[!i];
            incr i
          done;
          Buffer.contents b
        else s
      ) row
  | _ -> row

(** Apply all transformation rules to a dataset. *)
let transform_dataset dataset rules =
  let transformed_rows = List.map (fun row ->
    List.fold_left apply_transform_rule row rules
  ) dataset.rows in
  { headers = dataset.headers; rows = transformed_rows }

(* Validation functions *)

(** Validate a single field against a list of rules. *)
let validate_field field rule =
  match rule with
  | Regex pattern ->
      try
        let _ = Str.search_forward (Str.regexp pattern) field 0 in
        true
      with Not_found -> false
  | Length (min, max) ->
      let len = String.length field in
      len >= min && len <= max
  | Range (min, max) ->
      try
        let value = Float.of_string field in
        value >= min && value <= max
      with Failure _ -> false
  | Required ->
      field <> ""

(** Validate a row against a schema. *)
let validate_row row schema =
  let rec check_fields fields idx =
    match fields with
    | [] -> true
    | (field_name, rules) :: rest ->
        let field_value = List.nth row idx in
        let is_valid = List.for_all (validate_field field_value) rules in
        if is_valid then check_fields rest (idx + 1)
        else false
  in
  check_fields schema.fields 0

(** Validate all rows in a dataset against a schema. *)
let validate_dataset dataset schema =
  let valid_rows = List.filter (validate_row schema) dataset.rows in
  { headers = dataset.headers; rows = valid_rows }

(* Export functions *)

(** Export a dataset to a CSV string. *)
let export_csv dataset =
  let headers_line = String.concat "," dataset.headers in
  let rows_lines = List.map (String.concat ",") dataset.rows in
  let all_lines = headers_line :: rows_lines in
  String.concat "\\n" all_lines

(** Export a dataset to a JSON string. *)
let export_json dataset =
  let headers_json = dataset.headers |> List.map (fun s -> `String s) |> `List in
  let rows_json = dataset.rows |> List.map (fun row ->
    row |> List.map (fun s -> `String s) |> `List
  ) |> `List in
  let json = `Assoc ["headers", headers_json; "rows", rows_json] in
  Yojson.Basic.to_string json

(** Export a list of strings to a text string. *)
let export_text lines =
  String.concat "\\n" lines

(* Main processing pipeline *)

(** Process a CSV file. *)
let process_csv input_file output_file =
  let content = Sys.opaque_identity (open_in_bin input_file) in
  let lines = really_input_string content (in_channel_length content) in
  close_in content;
  let dataset = parse_csv lines in
  let transformed = transform_dataset dataset [Trim; ToLowercase] in
  let validated = validate_dataset transformed { fields = [] } in
  let output = export_csv validated in
  let out_channel = open_out_bin output_file in
  output_string out_channel output;
  close_out out_channel

let _ =
  if Array.length Sys.argv >= 3 then
    process_csv Sys.argv.(1) Sys.argv.(2)
  else
    print_endline "Usage: dpu <input_file> <output_file>"
