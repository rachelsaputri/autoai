# Text Formatting and Cleaning Tool

A comprehensive, high-performance text formatting and data cleaning engine written in Modula-2.

## Features
- Real-time text normalization (whitespace, newlines)
- Intelligent line filtering (empty lines, comments)
- Structured record extraction from unstructured logs
- Configurable output formats (cleaned text, structured CSV, JSON-like log format)
- Robust error handling and input validation
- Production-ready Modula-2 implementation

## Building
This project uses standard Modula-2 compiler (e.g., GNU MC, OOC, or M2C).

Compile the main module:
```bash
m2c Main.m2
```

Run the executable:
```bash
./Main input.txt
```

## Usage
```bash
./Main <input_file> [output_file] [mode]
```

Parameters:
- `input_file`: Path to the raw text/log file to process
- `output_file` (optional): Path to write cleaned output. If omitted, outputs to stdout
- `mode` (optional): Processing mode:
  - `clean` (default): Basic text normalization
  - `structured`: Extract key-value pairs from logs
  - `filter`: Remove empty lines and comment-only lines

## Examples

Clean a raw log file:
```bash
./Main raw_logs.txt cleaned_output.txt clean
```

Extract structured records:
```bash
./Main system.log records.csv structured
```

Filter and clean:
```bash
./Main messy_input.txt filtered.txt filter
```

## Architecture

- `Main.m2`: Entry point, argument parsing, and orchestration
- `TextEngine.m2`: Low-level character/string manipulation and normalization
- `DataProcessor.m2`: High-level processing pipeline and format handlers
- `Types.m2`: Core data structures and constants

## License
MIT License
