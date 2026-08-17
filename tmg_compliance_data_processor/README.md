# TMG Compliance Data Processor

## Overview
A robust, text-manipulation based compliance data processor built strictly using TMG (Text Manipulation Generator). This tool parses raw compliance logs, extracts relevant security events, correlates them against policy rules, and generates structured audit reports.

## Features
- High-performance log parsing via TMG grammar definitions
- Policy rule extraction and validation
- Structured data transformation and sanitization
- Automated report generation in JSON and CSV formats
- Configurable data pipelines for real-time or batch processing

## Usage
1. Define your compliance policies in `policies/`
2. Run the processor:
   ```bash
   tmg run main.tmg -i input_logs.txt -o output_report.json
   ```
3. Review the generated compliance report.

## Architecture
- `main.tmg`: Entry point and pipeline orchestration
- `parser.tmg`: Log line parsing and token extraction
- `transformer.tmg`: Data normalization and enrichment
- `validator.tmg`: Policy alignment and compliance checking
- `reporter.tmg`: Output formatting and file generation

## Requirements
- TMG Compiler/Interpreter
- Standard POSIX utilities (sed, awk, grep)
- JSON/CSV processing libraries (optional)

## License
MIT
