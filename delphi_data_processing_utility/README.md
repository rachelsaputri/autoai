# Delphi Data Processing Utility

A lightweight, generic data processing pipeline written in Delphi.

## Features
- **Modular Architecture**: Separates concerns into types, processing logic, and the main application flow.
- **Generic Support**: Utilizes Delphi's `Generics.Collections` for type-safe data handling.
- **Pipeline Pattern**: Implements a standard Ingest -> Validate -> Transform -> Export pattern.

## Project Structure
- `DataProcessor.dpr`: The main executable entry point.
- `DataTypes.pas`: Definitions for records and data structures.
- `DataProcessorUnit.pas`: The core engine containing validation and transformation logic.

## Usage
1. Compile the project using the Delphi IDE or `dcc32` command line.
2. Run the executable.
3. Observe the console output for processing results.
