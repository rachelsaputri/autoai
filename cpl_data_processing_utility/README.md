# CPL Data Processing Utility

A complete, fully functional data processing utility written in CPL (Comprehensive Programming Language). This tool is designed to handle CSV, JSON, and plain text data processing tasks with high performance and reliability.

## Features

- **CSV Processing**: Parse, validate, and transform CSV files.
- **JSON Processing**: Read, write, and manipulate JSON data.
- **Text Processing**: Clean, format, and analyze text data.
- **Modular Design**: Each component can be used independently or together.

## Components

### `data_processor.cpl`
Main module that orchestrates the data processing pipeline.

### `csv_handler.cpl`
Handles reading, writing, and transforming CSV data.

### `json_handler.cpl`
Manages JSON data ingestion, validation, and output.

### `text_handler.cpl`
Provides utilities for text cleaning, formatting, and analysis.

## Usage

1. Clone this repository.
2. Compile the CPL files using the CPL compiler.
3. Run the utility with the desired arguments.

Example:

```bash
cpl-compiler data_processor.cpl csv_handler.cpl json_handler.cpl text_handler.cpl
./data_processor --input data.csv --format csv --output result.json
```

## License

MIT License
