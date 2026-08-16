# MUMPS Data Processing Utility

## Overview
A modular MUMPS utility designed for high-performance data ingestion, transformation, and extraction.
MUMPS is particularly well-suited for this due to its high-speed global variable storage, efficient indexing capabilities, and compact syntax.

## Features
- **Ingestor**: Reads data from flat files or interfaces and populates global arrays.
- **Transformer**: Applies transformation rules (e.g., string manipulation, numeric calculations) to the dataset.
- **Extractor**: Queries the processed data and outputs structured results.

## Installation
1. Save the files in the `mumps_data_processing_utility` directory.
2. Load the classes or routines into your MUMPS instance (InterSystems IRIS, Caché, OpenMRS, etc.).

## Usage
```mumps
D INGEST^DPUtil("datafile.txt")
D TRANSFORM^DPUtil(
