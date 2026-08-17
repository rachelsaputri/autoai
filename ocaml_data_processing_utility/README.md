# OCaml Data Processing Utility (DPU)

This module provides a robust data processing utility for OCaml. It includes functionality for parsing, transforming, validating, and exporting data in various formats.

## Features
- **Parsing**: Parse CSV, JSON, and text data.
- **Transformation**: Normalize, transform, and filter data.
- **Validation**: Validate data against schemas.
- **Export**: Export processed data to CSV, JSON, or text.

## Installation
No additional dependencies are required beyond the standard OCaml distribution and `ocamlbuild` or `dune`.

## Usage
### Basic Example
```ocaml
open Dpu

let () =
  let data = load_csv "input.csv" in
  let transformed = transform data in
  let validated = validate transformed in
  save_csv validated "output.csv"
```
