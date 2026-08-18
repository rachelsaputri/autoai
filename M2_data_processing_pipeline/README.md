# M2 Data Processing Pipeline

This utility implements a modular data processing pipeline using Modula-2. It is designed for high-performance, type-safe data manipulation tasks.

## Features
- **Ingestor**: Loads data from standard input or simulated streams.
- **Transformer**: Applies transformation rules to data records.
- **Validator**: Checks data integrity and format compliance.
- **Reporter**: Outputs processed results in a structured format.

## Usage
Compile the modules into an executable `m2_pipeline.exe` and run it.

## Build Instructions
```bash
gm2 -c -o PipelineIngestor.mod
gm2 -c -o PipelineTransformer.mod
gm2 -c -o PipelineValidator.mod
gm2 -c -o PipelineReporter.mod
gm2 -c -o PipelineMain.mod
```
