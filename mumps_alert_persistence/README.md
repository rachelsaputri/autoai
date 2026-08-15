# MUMPS Alert Persistence Engine

## Overview
This repository contains the MUMPS-based alert persistence and correlation processor. It is designed to ingest high-volume alert data, apply correlation rules, and output enriched event records.

## Features
- High-throughput alert ingestion
- Pattern matching and correlation
- Global data storage using MUMPS namespaces
- Integration with compliance reporting modules

## Build and Installation
To compile and run the MUMPS engine, follow these steps:
1. Ensure you have a MUMPS implementation installed (e.g., GT.M, InterSystems IRIS).
2. Compile the MUMPS source files:
   ```bash
   mumps -c alert_processor.m
   ```
3. Run the engine:
   ```bash
   mumps alert_processor.m
   ```

## Global Namespace Definitions
The engine uses the following global namespaces:
- `^ALERT`: Stores raw alert data.
- `^CORRELATION`: Stores correlation rules and results.
- `^ENRICHED`: Stores enriched event records.

## Integration Protocols
The engine outputs enriched event records in a format compatible with the `compliance_reporting_module`. Ensure that the output directory is properly configured in the engine's settings.

## License
MIT
