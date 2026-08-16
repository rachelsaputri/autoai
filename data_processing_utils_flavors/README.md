# Data Processing Utility in Flavors

## Overview
This project implements a robust, functional data processing pipeline using the Flavors programming language. It focuses on transforming, cleaning, and analyzing raw datasets with a focus on composability and type safety.

## Features
- CSV Data Ingestion
- Data Cleaning (Null/Empty handling, Type conversion)
- Statistical Analysis (Mean, Median, Variance)
- Structured Output Generation

## Prerequisites
- Flavors compiler (`flc`)
- Standard library dependencies

## Usage

### Compilation
```bash
flc main.flv -o data_processor
```

### Execution
```bash
./data_processor input.csv
```

## Project Structure
- `main.flv`: Entry point and orchestration
- `ingestor.flv`: CSV parsing logic
- `cleaner.flv`: Data sanitization
- `analyzer.flv`: Statistical calculations
- `reporter.flv`: Output formatting

## License
MIT License
