# ActionScript Data Processing Utility

A complete, functional utility for data processing written in ActionScript.

## Features
- Data ingestion from various formats
- Data transformation and cleaning
- Data validation
- Data export and reporting

## Usage

To use this utility, include the following files in your ActionScript project:
- `main.as`
- `DataProcessor.as`
- `DataValidator.as`
- `DataExporter.as`

## Example

```actionscript
import com.example.dataprocessing.DataProcessor;
import com.example.dataprocessing.DataValidator;
import com.example.dataprocessing.DataExporter;

var processor:DataProcessor = new DataProcessor();
var validator:DataValidator = new DataValidator();
var exporter:DataExporter = new DataExporter();

var rawData:Array = [1, 2, "three", null, 4.5];
var validatedData:Array = validator.validate(rawData);
var processedData:Array = processor.process(validatedData);
exporter.export(processedData, "output.json");
```

## Requirements
- Adobe Flash Player 10.0+
- ActionScript 3.0

## License
MIT License
