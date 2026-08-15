# SAS Security Compliance Analyzer

## Overview
The SAS Security Compliance Analyzer is a data-driven security analytics engine built strictly using the SAS programming language. It is designed to ingest large-scale enterprise audit logs, perform statistical anomaly detection on security metrics, and generate deterministic compliance reports.

## Features
- **Automated Data Ingestion**: Reads raw log files and SQL-like data sources into SAS datasets.
- **Statistical Anomaly Detection**: Leverages SAS `PROC MEANS`, `PROC UNIVARIATE`, and macro variables to identify deviations from baseline security metrics.
- **Compliance Reporting**: Generates structured, auditable reports highlighting policy drift, vulnerability exposure, and regulatory non-compliance.
- **Macro-Driven Pipeline**: Fully configurable via SAS macros for flexible rule injection and report formatting.

## Directory Structure
```
sas_security_compliance_analyzer/
├── README.md
├── compliance_macros.sas
├── data_processor.sas
├── anomaly_detector.sas
├── report_generator.sas
└── run_pipeline.sas
```

## Setup & Execution
1. Ensure SAS 9.4 or SAS Viya environment is installed.
2. Place raw audit datasets or log files in the `./data/` directory.
3. Configure macro variables in `run_pipeline.sas` to match your environment paths.
4. Execute `run_pipeline.sas` using:
   ```sas
   %include 'run_pipeline.sas';
   %run_compliance_analysis();
   ```

## Usage Notes
- The analyzer expects pipe-delimited or CSV log formats.
- All output reports are saved to `./output/` in SAS dataset and HTML formats.
- Custom compliance rules can be appended to `compliance_macros.sas`.

## License
Internal Enterprise Use Only.
