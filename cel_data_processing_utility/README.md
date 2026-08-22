# CEL Data Processing Utility

A high-performance data processing utility written in the CEL (Common Expression Language) scripting language. 

This utility provides a modular framework for ingesting, transforming, validating, and reporting on structured data payloads. It leverages CEL's concise expression syntax to define transformation rules and validation logic dynamically.

## Features

- **Modular Architecture**: Distinct modules for each stage of the data pipeline (Ingestion, Transformation, Validation, Reporting).
- **Dynamic Rule Engine**: Leverages CEL's native evaluation capabilities for fast and secure data validation.
- **Structured Logging**: Built-in logging for audit trails and debugging.
- **Extensible**: Easy to add new transformation functions or validators.

## File Structure

- `main.cel`: Entry point and orchestrator.
- `ingester.cel`: Handles data source connections and payload retrieval.
- `transformer.cel`: Defines transformation logic and data mapping.
- `validator.cel`: Enforces data schemas and business rules.
- `reporter.cel`: Formats and outputs final data artifacts.

## Usage

To run the pipeline, execute the main module with your target configuration:

```bash
cel run main.cel --config ./config.json
```

## License

MIT License
