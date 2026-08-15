# apf_data_optimizer

An automated data transformation, validation, and optimization engine built entirely in APL. Designed for high-performance batch processing, this tool handles dataset schema validation, vectorized normalization, and rule-based array transformations.

## Features
- **Configurable Transformation Rules**: Define arrays of transformation parameters and apply them to datasets using vectorized operations.
- **Statistical Normalization**: Implements Z-score normalization, min-max scaling, and robust scaling using APL's native array math.
- **Schema Validation**: Validates input arrays against expected dimensions, types, and statistical properties before processing.
- **Batch Optimization**: Processes large datasets in chunks to minimize memory footprint while maintaining throughput.
- **Idempotent Operations**: All transformations are deterministic and safe for repeated execution.

## Architecture
The engine is split into modular APL namespaces (dyalog standard compatible):
- `TransformRules`: Parses and stores user-defined transformation logic.
- `DataValidator`: Checks input integrity, missing values, and type consistency.
- `Normalizer`: Applies statistical scaling functions.
- `BatchProcessor`: Orchestrates chunked execution and results aggregation.

## Usage
Load the main script `main.aplf` in your APL environment (e.g., Dyalog APL). Execute `main.aplf ⍬` to run the default pipeline with sample data, or pass a JSON configuration file path to customize transformations.

## Dependencies
- Dyalog APL (v18.0 or later recommended)
- No external libraries required. Pure APL implementation.

## License
MIT
