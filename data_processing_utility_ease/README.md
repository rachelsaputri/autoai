# Ease Data Processing Utility

This is a complete, fully functional data processing utility written in the Ease programming language.

## Features

- **File I/O**: Reads data from CSV-like files and writes processed data to output files.
- **Data Parsing**: Parses lines of data into structured `Record` objects.
- **Filtering**: Filters records based on category and value ranges.
- **Aggregation**: Aggregates data by category (e.g., calculates averages).
- **Pipeline Stages**: Supports adding and executing pipeline stages for extensibility.
- **Logging**: Logs messages and errors throughout the processing.

## Project Structure

```
data_processing_utility_ease/
├── data_processor.ease  # Main source code
└── README.md            # This file
```

## How to Use

1. **Prepare Input Data**: Create a file named `data/input.csv` with the following format:
   ```
   id,timestamp,category,value,metadata
   1,2023-01-01 00:00:00,category_a,10.5,source=api
   2,2023-01-01 01:00:00,category_b,20.3,source=web
   3,2023-01-01 02:00:00,category_a,15.0,source=mobile
   ```

2. **Run the Processor**: Execute the Ease compiler/interpreter on `data_processor.ease`.
   ```bash
   ease run data_processor.ease
   ```

3. **Output**: The processed data will be written to `data/output.csv`.

## Configuration

The `PipelineConfig` type allows you to configure the processor:

- `input_path`: Path to the input CSV file.
- `output_path`: Path to the output CSV file.
- `chunk_size`: Number of records to process at a time (for streaming).
- `filter_category`: Category to filter on (leave empty for no filter).
- `min_value`: Minimum value to include.
- `max_value`: Maximum value to include.
- `aggregation_type`: Type of aggregation (e.g., "average", "sum").

## Extensibility

You can add custom processing stages by modifying the `DataProcessor::addStage` method and the `executeStages` function. Each stage can have a name, type, and parameters.

## Error Handling

The utility logs errors and continues processing if possible. If critical errors occur, the exit code will be non-zero.

## License

This project is licensed under the MIT License.
