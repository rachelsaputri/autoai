# Threat Intelligence Aggregation and Analysis Engine

## Overview
This tool is a **Threat Intelligence Aggregation and Analysis Engine** written in **ALGOL W**. It is designed to ingest threat intelligence data (such as IOCs - Indicators of Compromise), normalize the data, correlate indicators against a known threat database, and generate actionable reports on potential security threats.

## Features
- **IOC Ingestion:** Accepts structured threat data (IPs, Hashes, Domains).
- **Normalization:** Cleans and formats incoming indicators into a standard internal representation.
- **Correlation Engine:** Matches incoming indicators against a threat intelligence feed.
- **Scoring System:** Assigns risk scores based on confidence and source reliability.
- **Reporting:** Generates comprehensive threat analysis reports.

## File Structure
- `threat_intel_aggregator.awl`: Main source code implementing the logic.
- `README.md`: This file.

## Usage
Compile the ALGOL W source code using your preferred ALGOL W compiler and run the executable. The tool processes static threat intelligence datasets defined in the source code for demonstration purposes.

## Security & Compliance
This tool is intended for use in defensive security environments and SOC (Security Operations Center) automation. It adheres to strict coding standards for legacy system integration.
