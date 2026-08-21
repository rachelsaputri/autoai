# Agora Data Processing Utility

A complete, production-ready data processing utility written in **Agora**. This tool implements a modular pipeline for ingesting, validating, transforming, and reporting data. It includes:

- **Ingestion**: Reads data from files, streams, or structured formats.
- **Validation**: Checks data integrity against schemas.
- **Transformation**: Applies business rules to normalize or enrich data.
- **Reporting**: Generates structured output (JSON, CSV, or text).

## Prerequisites

- A working Agora interpreter/compiler.
- Standard file I/O support (built-in to Agora).

## Usage

1. Place your input data files in the `input/` directory.
2. Run the main script:
   ```bash
   agora main.agora
   ```
3. Output will be generated in the `output/` directory.

## Architecture

- `main.agora`: Entry point that orchestrates the pipeline.
- `config.agora`: Defines global constants and settings.
- `processor.agora`: Contains core processing logic (validate, transform, report).
- `data_types.agora`: Defines structures and type checks.
- `utils.agora`: Helper functions for file I/O and string manipulation.

## License

MIT License
