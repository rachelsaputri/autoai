# Haxe Data Processing Utility

A comprehensive, production-ready command-line utility for data processing tasks written in Haxe. It provides validation, cleaning, transformation, and export capabilities for common data formats.

## Features

- **JSON Validation**: Validates JSON files for syntax correctness.
- **CSV Cleaning**: Removes empty lines and optionally trims whitespace from CSV files.
- **JSON Transformation**: Basic transformation engine (e.g., normalization) for JSON data.
- **JSON to CSV Export**: Converts structured JSON data into CSV format.

## Prerequisites

- [Haxe](https://haxe.org/) compiler (version 4.2+ recommended)
- [Neko](https://nekovm.org/) or [C++](https://haxe.org/manual/target-cpp.html) target runtime

## Installation

1. Clone the repository.
2. Ensure Haxe is installed on your system.
3. No additional dependencies are required.

## Usage

### Validate JSON

Validates a JSON file for syntax errors.

```bash
hx run src/DataProcessingUtil.hx validate <json_file>
```

### Clean CSV

Cleans a CSV file by removing empty lines and trimming whitespace.

```bash
hx run src/DataProcessingUtil.hx clean <csv_file> [--delimiter=<char>] [--trim]
```

### Transform JSON

Transforms JSON data (e.g., normalizes strings to lowercase) and saves to a new file.

```bash
hx run src/DataProcessingUtil.hx transform <input_json> <output_json>
```

### Export JSON to CSV

Converts a JSON file into a CSV file.

```bash
hx run src/DataProcessingUtil.hx export <input_json> <output_csv>
```

## Building

You can compile the utility into a standalone executable for your target platform.

### Neko Target

```bash
hx build src/DataProcessingUtil.hx -neko data_processor.neko
neko data_processor.neko
```

### C++ Target

```bash
hx build src/DataProcessingUtil.hx -cpp bin
bin/DataProcessingUtil
```

### JS Target

```bash
hx build src/DataProcessingUtil.hx -js bin/data_processor.js
node bin/data_processor.js
```

## License

MIT
