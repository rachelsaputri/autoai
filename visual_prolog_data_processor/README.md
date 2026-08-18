# Visual Prolog Data Processor

A modular data processing utility written in Visual Prolog.

## Features

- **Data Ingestion**: Reads structured data from CSV and JSON formats.
- **Transformation**: Applies filtering and mapping rules to datasets.
- **Validation**: Ensures data integrity based on configurable schema constraints.
- **Reporting**: Outputs processed data as validated records or error logs.

## Usage

1. Ensure Visual Prolog IDE (Community or Professional) is installed.
2. Open the `data_processor.pvproj` project file.
3. Build the project (`Build` > `Build Solution`).
4. Run the application via the IDE or command line.

## Project Structure

- **data_processor.pvproj**: The main project file defining modules and dependencies.
- **data_engine.cl**: Core logic for data ingestion, transformation, and validation.
- **reporter.cl**: Utility module for formatting and outputting processed data.
- **types.cl**: Domain types and interfaces defining the data structures.

## License

MIT License
