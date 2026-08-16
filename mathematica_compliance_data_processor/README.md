# Mathematica Compliance Data Processor

A robust, production-ready data processing utility built using the Wolfram Language (Mathematica). 

## Features

- **Multi-Format Ingestion**: Reads JSON, CSV, and WDX (Wolfram Data Exchange) files.
- **Data Validation**: Enforces type consistency and schema constraints.
- **Transformation**: Supports cleaning, normalization, and feature engineering.
- **Exporting**: Outputs processed data back to JSON or CSV.

## Usage

1. Place the `Processor.wl` file in a `bin/` directory or run via `Mathematica -script`.
2. Prepare your data in the `data/` directory.
3. Execute:
   ```bash
   wolfram -script Processor.wl --input data/input.json --output data/output.csv
   ```
