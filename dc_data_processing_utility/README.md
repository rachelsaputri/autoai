# DC Data Processing Utility

A robust, command-line data processing utility written in `dc` (Desk Calculator).

## Overview

This utility processes raw data files (CSV, TSV, TXT) performing aggregation, filtering, statistical analysis, and normalization. It is designed for high-performance, low-level data manipulation in Unix environments.

## Features

- **CSV/TSV Parsing**: Handles comma and tab-separated values efficiently.
- **Statistical Aggregation**: Calculates mean, median, min, max, standard deviation, and sum.
- **Normalization**: Z-score normalization and Min-Max scaling.
- **Filtering**: Supports threshold-based row filtering.
- **Export**: Outputs results in JSON or raw text formats.

## Usage

Make the script executable:
```bash
chmod +x main.dc
```

Run the processor:
```bash
./main.dc <input_file> [output_file] [mode] [column_index]
```

### Arguments

1. `<input_file>`: Path to the data file (`.csv`, `.tsv`).
2. `<output_file>`: (Optional) Path to write results. Defaults to stdout.
3. `[mode]`: Processing mode. Default: `stats`.
   - `stats`: Calculate statistical aggregates.
   - `normalize`: Normalize data using Z-Score.
   - `filter`: Filter rows based on a threshold.
4. `[column_index]`: (Optional) 1-based index of the target numeric column. Default: last column.

## Requirements

- GNU `dc` (Desk Calculator)
- `bash` or `sh` shell
- `bc` (for complex math in some modes)

## License

MIT
