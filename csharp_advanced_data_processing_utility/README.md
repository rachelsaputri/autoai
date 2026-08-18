# C# Advanced Data Processing Utility

A complete, production-ready data processing utility built in C# (.NET 6+). This utility provides a flexible pipeline for ingesting, transforming, validating, and exporting data.

## Features
- **Data Ingestion**: Supports reading from CSV, JSON, and XML sources.
- **Transformation Engine**: Apply custom logic to records using a pipeline pattern.
- **Validation Framework**: Enforce data integrity with configurable rules.
- **Export Module**: Output processed data back to CSV, JSON, or XML formats.
- **Error Handling**: Robust exception handling and logging.

## Prerequisites
- .NET 6.0 SDK or higher
- Visual Studio 2022 or `dotnet` CLI

## Setup Instructions

1. Clone the repository or download the files.
2. Open a terminal in the `csharp_advanced_data_processing_utility` directory.
3. Run `dotnet restore` to restore NuGet packages.
4. Run `dotnet build` to compile the project.
5. Run `dotnet run` to execute the utility with sample data.

## Project Structure

- `Program.cs`: Entry point demonstrating the pipeline.
- `Models/DataRecord.cs`: Core data model.
- `Parsers/DataParser.cs`: Handles CSV, JSON, and XML parsing.
- `Transformers/DataTransformer.cs`: Applies transformation logic.
- `Validators/DataValidator.cs`: Validates records against rules.
- `Exporters/DataExporter.cs`: Handles file output.
- `DataProcessingUtility.csproj`: Project configuration.

## License
MIT License
