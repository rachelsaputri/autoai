# Prograph Data Cleaning Toolkit

This module provides a comprehensive toolkit for automated dataset cleaning and text formatting using Prograph's visual programming paradigm.

## Features
- **Schema Validation**: Automatically validates data structures against defined schemas.
- **Text Normalization**: Handles case conversion, whitespace normalization, and special character removal.
- **Missing Value Handling**: Strategies for imputation or removal of null/empty entries.
- **Duplicate Detection**: Identifies and handles duplicate records.
- **Format Transformation**: Converts data types (e.g., string to date, string to number).

## Components

### DataCleaner.pr
The main entry point for the data cleaning pipeline.

### SchemaValidator.pr
Validates input datasets against a predefined schema structure.

### TextFormatter.pr
Handles string manipulation tasks like trimming, casing, and sanitization.

### DuplicateDetector.pr
Scans datasets for redundant entries based on key fields.

### MissingValueHandler.pr
Imputes missing values using default strategies or user-defined functions.

## Usage
1. Drag and drop the relevant Prgraph blocks into your workspace.
2. Connect the data stream to the `CleanPipeline`.
3. Configure schema and formatting rules via the properties panel.
4. Export the cleaned dataset to your preferred format (CSV, JSON, etc.).
