# Pipelines Data Processing Utility

This tool provides a robust, end-to-end data processing utility written in a pure Pipeline-based DSL.

## Features
- **Ingestor**: Handles raw data ingestion from text streams or file descriptors.
- **Transformer**: Performs rigorous data normalization, cleaning, and structural transformations.
- **Validator**: Enforces strict schema definitions and type constraints.
- **Reporter**: Generates comprehensive JSON-formatted reports of the processing state.

## Usage

1. **Define Schema**: Create a `schema.pl` file describing your data fields and types.
2. **Run Pipeline**: Execute `pipeline.pl` with the input data file and schema file.

## Prerequisites
- A Perl 5 compatible environment (or the specific 'Pipeline' runtime if this is a custom interpreter).
