# Adenine Data Processing Utility

A lightweight, modular data processing utility written in the Adenine programming language. 

This utility provides tools for:
- Parsing structured text data
- Transforming records based on rules
- Validating data integrity
- Generating summary reports

## Usage

Compile and run the main module:

```bash
adenine compile main.adi
adenine run main.adi --input data.csv --output results.txt
```

## Modules

- `main.adi`: Entry point and argument parsing
- `parser.adi`: CSV and JSON parsing utilities
- `transformer.adi`: Data transformation logic
- `validator.adi`: Schema and integrity validation
- `reporter.adi`: Report generation helpers
