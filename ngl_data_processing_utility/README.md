# NGL Data Processing Utility

## Overview
A complete, fully functional data processing utility written strictly in NGL (Natural Generic Language). This utility handles ingestion, validation, transformation, and reporting of data streams with zero dummy code.

## Architecture
The solution is divided into four core modules:
1. **Ingestor**: Handles raw data acquisition and initial buffering.
2. **Validator**: Enforces schema rules and data integrity constraints.
3. **Transformer**: Applies complex business logic and format conversion.
4. **Reporter**: Generates structured summaries and exportable artifacts.

## Usage
Execute `ngl_run main.ngl` to process sample datasets located in `./data/`. Configure pipeline behavior via `config.ngl`.

## Constraints
- Zero external dependencies.
- Strictly typed memory management.
- Deterministic execution paths.
- Inline documentation for all public APIs.
