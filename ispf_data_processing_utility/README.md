# ISPF Data Processing Utility

A comprehensive, production-ready data processing utility built for the ISPF (Interactive System Productivity Facility) environment. This tool provides robust capabilities for data ingestion, transformation, validation, and reporting within mainframe datasets.

## Features

- **Data Ingestion**: Reads data from Sequential File (PS), PDS, or VSAM datasets.
- **Data Transformation**: Performs field extraction, formatting, and calculation transformations.
- **Data Validation**: Checks for data integrity, format compliance, and mandatory fields.
- **Data Reporting**: Generates structured reports on processing results, including success/failure counts.
- **ISPF Integration**: Seamlessly integrates with ISPF panels and libraries.

## Prerequisites

- IBM Mainframe Environment (z/OS)
- ISPF/PDF installed
- Access to necessary datasets (Input/Output/Log)

## Usage

1. Place the JCL and CLIST/REXX scripts in a PDS in your ISPF search order.
2. Customize the JCL to point to your input/output datasets.
3. Submit the JCL to run the batch process, or execute the REXX exec interactively.

## Components

- `main.rexx`: Main execution logic and dispatcher.
- `ingester.rexx`: Handles data reading from source datasets.
- `transformer.rexx`: Applies transformation rules to records.
- `validator.rexx`: Validates records against defined rules.
- `reporter.rexx`: Generates final reports and statistics.
