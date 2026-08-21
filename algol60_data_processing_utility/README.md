# ALGOL 60 Data Processing Utility

## Description
This is a comprehensive data processing utility written in ALGOL 60. It implements a modular pipeline capable of ingesting data, validating structures, transforming formats, and generating reports. The tool is designed for batch processing of structured records.

## Architecture
The system is divided into four core modules:
1. `main.a60`: Entry point, handles command-line arguments and orchestration.
2. `parser.a60`: Parses raw input strings into structured records.
3. `validator.a60`: Validates record integrity and type correctness.
4. `reporter.a60`: Generates formatted text reports from processed data.

## Usage
Compile the ALGOL 60 source files using a standard ALGOL 60 compiler (e.g., ALGOL 68G or MTS ALGOL 60). Run the resulting executable with input data files.

## Example
Input Data (data.txt):
```
REC01;JOHN;45;M
REC02;JANE;32;F
```

Output Report:
```
PROCESSING COMPLETE
RECORDS PROCESSED: 2
VALID RECORDS: 2
INVALID RECORDS: 0
```

## License
MIT
