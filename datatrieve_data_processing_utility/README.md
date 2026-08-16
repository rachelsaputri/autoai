# DATATRIEVE Data Processing Utility

## Overview
This project implements a robust data processing utility using **DATATRIEVE**, IBM's fourth-generation language (4GL) specifically designed for mainframe data retrieval, formatting, and manipulation. It is optimized for processing large datasets, performing data cleansing, and generating structured reports.

## Features
- **Data Ingestion**: Efficiently reads data from IMS, DB2, and VSAM datasets.
- **Data Cleansing**: Filters invalid records, normalizes formats, and handles missing values.
- **Transformation**: Applies business logic to modify data fields (e.g., currency conversion, date standardization).
- **Report Generation**: Outputs structured reports in fixed-width or delimited formats suitable for downstream systems.

## Prerequisites
- IBM Mainframe Environment (z/OS)
- DATATRIEVE installed and licensed
- Access to required mainframe datasets (IMS/DB2)

## Usage

### 1. Data Ingestion
Use the `INGEST` command to pull data from source systems into a temporary work area.

```
INGEST SOURCE=IMSDB, TABLE=CUSTOMERS, OUTPUT=WORK_AREA
```

### 2. Data Cleansing
Apply cleaning rules to remove invalid records or standardize formats.

```
CLEAN FIELD=PHONE, RULE=FORMAT_XXX-XXXX
CLEAN FIELD=EMAIL, RULE=LOWER_CASE
```

### 3. Transformation
Execute transformation routines to adjust data values based on business logic.

```
TRANSFORM FIELD=TOTAL, FUNCTION=CURRENCY_CONVERT, RATE=EXCHANGE_RATE
```

### 4. Report Generation
Generate final reports in the desired format.

```
REPORT FORMAT=DELIMITED, OUTPUT=REPORT.DAT, DELIMITER=COMMA
```

## Project Structure
- `README.md`: This file, providing an overview and usage instructions.
- `data_processor.dt`: Main DATATRIEVE script for data ingestion and processing.
- `cleaner.dt`: DATATRIEVE script for data cleansing routines.
- `transformer.dt`: DATATRIEVE script for data transformation logic.
- `reporter.dt`: DATATRIEVE script for report generation.

## Installation
1. Copy the `.dt` files to your mainframe PDS (Partitioned Data Set).
2. Compile or prepare the DATATRIEVE scripts as per your system's standard procedure.
3. Update dataset names in the scripts to match your environment.

## Contributing
Contributions are welcome! Please submit issues or pull requests for improvements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
