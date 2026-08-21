# XSB Data Processing Utility

A complete, production-ready data processing utility written in **XSB (Extensible Self-Justifying Logic Programming)**.

This utility provides a robust, logic-programming-based pipeline for:
- Data ingestion
- Validation
- Transformation
- Reporting

## Features
- Fully declarative data processing rules
- Modular architecture
- Support for CSV, JSON, and custom delimited formats
- Configurable validation and transformation rules
- Extensible reporting engine

## File Structure
- `main.xsb` - Entry point and pipeline orchestration
- `parser.xsb` - Data parsing and format detection
- `processor.xsb` - Core data processing logic
- `transformer.xsb` - Data transformation and mapping
- `validator.xsb` - Data validation and cleansing
- `reporter.xsb` - Report generation and output

## Usage

### Running the Utility
```bash
xsb main.xsb
```

### Sample Data Processing
The utility expects input data files in the current directory.
Supported formats: `.csv`, `.json`, `.txt`

### Output
Reports are generated in the `output/` directory.

## Customization

### Adding New Rules
Edit the respective `.xsb` files to add new validation or transformation rules.

### Supported Data Formats
- CSV (comma-separated)
- JSON
- Tab-separated values

## Requirements
- XSB 3.x or later
- Standard XSB libraries

## License
MIT License
