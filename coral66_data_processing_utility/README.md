## Coral 66 Data Processing Utility

This directory contains a data processing utility implemented strictly in Coral 66.

### Features
- Ingests data from standard input or files.
- Transforms data according to predefined rules.
- Validates data integrity.
- Outputs processed data in standard formats.

### Usage
Compile the source files using a Coral 66 compiler and link the modules. Run the resulting executable to process data.

### Structure
- `types.cor`: Definitions of data structures and types.
- `parser.cor`: Logic for parsing input data.
- `transformer.cor`: Logic for transforming data.
- `validator.cor`: Logic for validating data.
- `processor.cor`: Main processing loop and orchestration.
- `output.cor`: Logic for formatting and outputting data.

### Compilation
```bash
c66 types.cor parser.cor transformer.cor validator.cor processor.cor output.cor -o dataprocessor
```

### Requirements
- Coral 66 compiler
