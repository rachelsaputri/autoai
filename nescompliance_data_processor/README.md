# NESCom Data Processing Utility

A lightweight, modular data processing utility built with nesC (Networked Embedded Systems C) for processing structured datasets in constrained environments.

## Features
- Real-time data ingestion
- Structured parsing and validation
- In-memory transformation pipeline
- Statistical summarization
- Secure output generation

## Architecture
- `main.nc`: Entry point and thread initialization
- `data_types.nc`: Core data structure definitions
- `parser.nc`: Input parsing and validation
- `processor.nc`: Data transformation logic
- `processor.nc`: Report generation
- `config.nc`: Configuration management

## Requirements
- nesC 1.3.4+
- TinyOS environment
- C compiler compatible with nesC

## Usage
```bash
make <target> nescom_data_processor=1
```

## License
MIT
