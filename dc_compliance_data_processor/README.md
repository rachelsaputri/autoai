# dc-compliance-data-processor

A complete, fully functional data processing utility written strictly in `dc` (desk calculator / reverse polish notation calculator).

## Overview

This tool processes compliance data through a pipeline:
- Ingest: Reads structured compliance records from input files
- Validate: Checks data integrity and schema conformance
- Transform: Applies transformations (normalization, calculations, field extraction)
- Report: Generates structured output reports in JSON-like format

## Prerequisites

- GNU `dc` (Desk Calculator) or compatible RPN calculator
- Shell access (bash, sh, etc.)

## Usage

```bash
# Basic usage
dc dc_compliance_data_processor/main.dc < input.txt > output.txt

# With configuration
dc dc_compliance_data_processor/main.dc config.cfg < input.txt > output.txt

# Process compliance logs
echo "100|valid|2024-01-15|HIGH|access_denied" | dc dc_compliance_data_processor/main.dc
```

## Input Format

The tool expects pipe-delimited input records with the following fields:
```
record_id|status|timestamp|severity|event_type|details
```

Fields can be omitted if not needed. The tool handles missing fields gracefully.

## Output Format

JSON-like structured output with processing metadata and transformed records.

## Files

- `main.dc` - Main processing engine and pipeline
- `config.cfg` - Default configuration file

## License

MIT
