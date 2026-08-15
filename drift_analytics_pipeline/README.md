# Drift Analytics Pipeline

## Overview
The Drift Analytics Pipeline is a specialized data processing system designed to consume raw configuration drift audit logs and transform them into actionable compliance metrics and trend reports. It leverages Hartmann pipelines for high-performance stream processing and pattern recognition.

## Architecture
The pipeline operates in three distinct stages:
1. **Ingestion**: Reads raw JSON audit logs from the `config_drift_audit` service.
2. **Analysis**: Applies Hartmann pipeline rules to detect frequency anomalies and severity clusters.
3. **Reporting**: Generates structured compliance reports for human review and automated alerting.

## Integration
- **Input**: `./drift_analytics_pipeline/logs/` directory or standard input stream.
- **Output**: `./drift_analytics_pipeline/reports/` directory.
- **Config**: `pipeline.hartmann` configuration file.

## Usage
Run the pipeline with the Hartmann runtime:
```bash
hartmann run pipeline.hartmann
```
