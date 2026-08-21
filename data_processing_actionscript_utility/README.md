# Data Processing Utility (ActionScript 3.0)

## Overview

A complete, production-ready ActionScript 3.0 data processing utility that handles:

- **Data Ingestion**: Parses delimited text data (CSV, TSV, etc.)
- **Validation**: Configurable validation rules (non-empty, numeric, custom)
- **Transformation**: Converts records to XML format for internal processing
- **Export**: Exports processed data to CSV, JSON, and XML formats
- **Error Handling**: Comprehensive error collection and reporting

## Features

### Robust CSV Parsing
- Handles quoted fields with embedded delimiters
- Supports escaped quotes within quoted fields
- Configurable delimiter (comma, tab, semicolon, etc.)
- Header skipping option

### Validation Rules
- `non_empty`: Ensures all fields are non-empty
- `numeric_first`: Ensures first field is numeric
- `none`: No validation (default)

### Export Formats
- **CSV**: Properly escaped and quoted output
- **JSON**: Human-readable formatted JSON
- **XML**: Structured XML output

### Error Handling
- Collects all errors during processing
- Reports line numbers for problematic records
- Skips invalid records without halting processing
- Tracks record count and error count

## Usage

### Basic Processing

```actionscript
var config:XML = <config>
	<delimiter>,</delimiter>
	<skipHeaders>true</skipHeaders>
	<validationRule>non_empty</validationRule>
</config>;

var result:* = DataProcessor.processData(dataString, config);

// Access results
trace("Records: " + result.count);
trace("Errors: " + result.errorCount);

for each (var record:XML in result.data) {
	trace(record.field_1.toString());
}
```

### Exporting Data

```actionscript
var csvOutput:String = DataProcessor.exportData(dataArray, "csv");
var jsonOutput:String = DataProcessor.exportData(dataArray, "json");
var xmlOutput:String = DataProcessor.exportData(dataArray, "xml");
```

## Limitations

- Maximum record size: 1MB
- Maximum field size: 10KB
- Requires Flash Player 9+ or AIR runtime

## Files

- `DataProcessor.as`: Main processing logic
- `main.as`: Entry point with sample data and UI
- `DataProcessorUnit.pas`: Pascal unit (reference only)
- `DataTypes.pas`: Pascal types (reference only)
- `README.md`: This documentation

## Requirements

- Adobe Flash Player 9.0+ or Adobe AIR 1.0+
- ActionScript 3.0 compiler

## License

MIT License
