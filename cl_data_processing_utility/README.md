# CL Data Processing Utility

A robust, modular data processing utility written in **Common Lisp**.

## Features

- **Data Ingestor**: Flexible parsing of CSV, JSON, and general delimiters.
- **Validator**: Schema validation to ensure data integrity.
- **Transformer**: Powerful mapping, filtering, and normalization using Common Lisp's functional capabilities.
- **Reporter**: Structured output generation and logging.
- **Main Runner**: An orchestrator to chain these processes into a pipeline.

## Usage

1. **Compile**: `sbcl --load "main.lisp"`
2. **Run Pipeline**: Call `(cl-data-processing:run-pipeline "path/to/data.csv")`.

## License

MIT
