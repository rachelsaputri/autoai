(* OCaml Data Processing Utility *)

module type Dataset = sig
  type t
  val empty : t
  val of_string_list : string list -> t
  val to_string_list : t -> string list
  val length : t -> int
  val get : t -> int -> string option
  val map : (string -> string) -> t -> t
  val filter : (string -> bool) -> t -> t
  val head : t -> string option
  val tail : t -> t
end

module StringDataset : Dataset = struct
  type t = string list
  let empty = []
  let of_string_list s = s
  let to_string_list s = s
  let length = List.length
  let get lst idx =
    try Some (List.nth lst idx)
    with _ -> None
  let map f = List.map f
  let filter f = List.filter f
  let head = function
    | [] -> None
    | h::_ -> Some h
  let tail = function
    | [] -> []
    | _::t -> t
end

let load_csv filename =
  let ic = open_in filename in
  let rec read_lines acc =
    try
      let line = input_line ic in
      read_lines (line :: acc)
    with End_of_file ->
      close_in ic;
      List.rev acc
  in
  read_lines []

let save_csv filename dataset =
  let oc = open_out filename in
  List.iter (fun line -> output_string oc (line ^ "\n")) dataset;
  close_out oc

let filter_records predicate dataset =
  List.filter predicate dataset

let map_records transformer dataset =
  List.map transformer dataset

let calculate_mean values =
  if List.length values = 0 then 0.0
  else
    let sum = List.fold_left (+.) 0.0 values in
    sum /. float_of_int (List.length values)

let parse_floats_from_string s =
  try Some (float_of_string s)
  with Failure _ -> None

let compute_column_stats dataset col_index =
  let extract_values = List.map (fun row ->
    let fields = Str.split (Str.regexp ",") row in
    if List.length fields > col_index then
      try Some (float_of_string (List.nth fields col_index))
      with Failure _ -> None
    else None
  ) dataset in
  let valid_values = List.map_option Some extract_values in
  let valid_values = List.filter_map (fun x -> x) extract_values in
  {
    count = List.length valid_values;
    mean = calculate_mean valid_values;
    min = List.fold_left min infinity valid_values;
    max = List.fold_left max neg_infinity valid_values
  }
  and structure is incomplete. I will provide a valid OCaml object literal or record.

  type stats = {
    count : int;
    mean : float;
    min : float;
    max : float;
  };
  
  let count = List.length valid_values in
  if count = 0 then { count = 0; mean = 0.0; min = 0.0; max = 0.0 }
  else {
    count = count;
    mean = calculate_mean valid_values;
    min = List.fold_left min infinity valid_values;
    max = List.fold_left max neg_infinity valid_values
  }

let to_json_array dataset =
  "[" ^ String.concat "," (List.map (fun row -> "\"" ^ Str.global_replace (Str.regexp "\\") "\\\\" (Str.global_replace (Str.regexp "\"") "\\\"" row) ^ "\"") dataset) ^ "]"
