# Epigram Data Processing Utility

This directory contains a functional data processing pipeline written in **Epigram**, a dependently-typed functional programming language.

The utility is designed to handle type-safe data ingestion, transformation, validation, and reporting. All functions are guaranteed to be total and well-typed, ensuring correctness at compile-time.

## Architecture

- **`data_types.epi`**: Defines dependent types for records and the data processing state machine.
- **`processor.epi`**: Implements the core transformation logic and validation rules.
- **`main.epi`**: Entry point that initializes the pipeline and runs the processing logic.

## Usage

1. Ensure the Epigram compiler is installed.
2. Compile the project:
   ```bash
   epigram-compile main.epi
   ```
3. Execute the compiled binary:
   ```bash
   ./main
   ```

## License

MIT
