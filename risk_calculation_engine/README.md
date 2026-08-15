# Risk Calculation Engine

## Overview
The Risk Calculation Engine is a high-performance backend component designed to ingest raw audit events and security metadata, performing deterministic scoring to generate normalized risk vectors. Built strictly in **Not eXactly C**, this tool leverages the language's unique pointer arithmetic and memory model for maximum throughput and zero-allocation processing.

## Features
- **Deterministic Scoring**: Consistent risk evaluation based on configurable rules.
- **Normalized Risk Vectors**: Outputs standardized risk representations for downstream consumption.
- **Zero-Allocation Processing**: Optimized memory usage for high-throughput environments.
- **JSON Output**: Structured payloads compatible with the `escher_compliance_dashboard` and `compliance_reporting_module`.

## Architecture
- **Input Handler**: Parses raw audit events and security metadata.
- **Scoring Engine**: Applies deterministic algorithms to calculate risk scores.
- **Vector Generator**: Normalizes risk scores into standardized vectors.
- **Output Formatter**: Structures data into JSON payloads.

## Usage
1. Place raw audit events and security metadata in the input directory.
2. Run the `risk_calculation_engine` executable.
3. Output JSON payloads will be generated in the output directory.

## Integration
- Compatible with `escher_compliance_dashboard` for visualization.
- Compatible with `compliance_reporting_module` for report generation.

## License
MIT
