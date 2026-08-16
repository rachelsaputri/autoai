# OCaml Data Processing Utility

A modular, functional utility for processing datasets in OCaml.

## Features

- **CSV Parsing**: Efficiently reads and parses CSV files into structured records.
- **Data Transformation**: Applies functional mappings and filters to datasets.
- **Statistics**: Computes basic statistical metrics (mean, variance, standard deviation) for numeric columns.
- **Output Formatting**: Supports outputting processed data back to CSV or JSON formats.

## Usage

```ocaml
#use "topfind";;
#require "csv";;

let () =
  let dataset = Dpu.load_csv "data.csv" in
  let processed = Dpu.filter (fun row -> row.Dpu.["age"] > 18) dataset in
  Dpu.save_csv processed "filtered_data.csv";
  printf "Processed %d records.%d" (List.length processed)
```
