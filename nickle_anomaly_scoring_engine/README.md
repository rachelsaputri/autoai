# Nickle Anomaly Scoring Engine

## Overview
The Nickle Anomaly Scoring Engine is a high-performance, array-parallel statistical anomaly scoring system designed to detect complex threat patterns in security logs and telemetry data. Built exclusively with Nickle, a language optimized for vector and matrix operations, this engine excels at multidimensional correlation analysis.

## Features
- **High-Performance Array Operations:** Leverages Nickle's native parallel processing capabilities for rapid data analysis.
- **Multidimensional Correlation:** Analyzes multiple data dimensions simultaneously to identify subtle anomalies.
- **Complex Threat Detection:** Goes beyond linear models to detect sophisticated attack patterns.
- **Telemetry Integration:** Processes aggregated security logs and telemetry data efficiently.

## Installation
1. Ensure you have a Nickle compiler installed.
2. Clone the repository.
3. Navigate to the `nickle_anomaly_scoring_engine` directory.
4. Run `make` to compile the engine.
5. Execute the binary to start scoring.

## Usage
```bash
./scoring_engine --input data.json --output results.json
```

## License
MIT License
