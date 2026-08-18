# HLASM Data Processing Utility

A robust, production-ready data processing utility written in **High Level Assembly (HLASM)** for IBM Z mainframes (z/OS).

## Overview

This utility provides a modular framework for ingesting, validating, transforming, and reporting on structured data records. It is designed to run in a z/OS batch environment or as a callable service via CICS/IMS.

## Features

- **Modular Architecture**: Separated into loader, parser, transformer, validator, reporter, and main orchestrator.
- **Structured Data Handling**: Supports fixed-length and delimited record formats.
- **Error Handling**: Comprehensive error logging and exit code management.
- **Configuration**: Externalizable configuration via control blocks.
- **Performance**: Optimized for mainframe memory constraints using overlays and efficient register usage.

## Components

- `loader.asm`: Ingests raw data from a dataset (PS/DS) or stdin.
- `parser.asm`: Parses raw bytes into structured records.
- `transformer.asm`: Applies business logic transformations to data fields.
- `validator.asm`: Validates data integrity and compliance rules.
- `reporter.asm`: Generates formatted output reports.
- `main.asm`: Main entry point and orchestrator.

## Usage

Compile and link-edit the modules:

```bash
HLASM LOAD SOURCE=main.asm,LIST=main.lst,RENT=ON
HLASM LOAD SOURCE=loader.asm,LIST=loader.lst,RENT=ON
HLASM LOAD SOURCE=parser.asm,LIST=parser.lst,RENT=ON
HLASM LOAD SOURCE=transformer.asm,LIST=transformer.lst,RENT=ON
HLASM LOAD SOURCE=validator.asm,LIST=validator.lst,RENT=ON
HLASM LOAD SOURCE=reporter.asm,LIST=reporter.lst,RENT=ON

LINK OBJECT(main),OBJECT(loader),OBJECT(parser),OBJECT(transformer),OBJECT(validator),OBJECT(reporter),OUTPUT(main),RENT
```

## License

MIT License
