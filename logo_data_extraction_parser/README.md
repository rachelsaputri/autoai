# Logo Data Extraction Parser

A robust data extraction and parsing utility implemented in the Logo programming language. 

## Features
- Multi-format parsing (CSV, Fixed-Width, and JSON-like structures)
- Type coercion for extracted values
- Nested structure support for JSON
- Error handling and validation
- Command-line interface for batch processing

## Usage

To run the parser, simply execute the logo file with your target data file as the first argument.

```bash
logo logo_data_extraction_parser.lgo data.csv
logo logo_data_extraction_parser.lgo data.txt
logo logo_data_extraction_parser.lgo data.json
```

## File Structure
- `logo_data_extraction_parser.lgo`: The main executable containing all parsing logic.
- `README.md`: This documentation file.
