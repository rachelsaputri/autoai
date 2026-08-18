# GM Data Processing Utility

## Overview
A fully functional data processing utility written in GameMaker Language (GM/GML). 
This utility handles data ingestion, transformation, validation, and reporting.
It is designed to be embedded in a GameMaker project.

## Files Included
- `main.gml`: The core controller script that initializes the processor and runs the pipeline.
- `parser.gml`: Handles parsing of raw string data into structured formats (e.g., CSV, JSON-like strings).
- `transformer.gml`: Contains logic for transforming data records (e.g., normalization, type conversion, aggregation).
- `validator.gml`: Validates data records against defined rules and constraints.
- `reporter.gml`: Generates summary reports and statistics from the processed data.

## Usage
1. Place all `.gml` files in your GameMaker project's scripts folder.
2. Call `main_init()` to initialize the processor.
3. Pass raw data string to `main_process_data(raw_data_string)`.
4. Retrieve results via `main_get_report()`.

## Notes
- This utility assumes the data is provided as a delimited string (CSV format by default).
- Memory management is handled automatically by GameMaker's garbage collection.
