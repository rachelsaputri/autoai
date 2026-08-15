# TACPOL Data Extraction Utility

This tool is a data extraction and parsing utility built in TACPOL. It is designed to extract specific data fields from structured text inputs, apply optional transformations, and output the results in a standardized format (JSON or CSV).

## Features
- **Pattern Matching**: Extracts data based on defined regular expression patterns.
- **Batch Processing**: Handles multiple lines of input efficiently.
- **Structured Output**: Outputs results in JSON or CSV format.

## Usage
1. Save the source code as `data_extractor.tacpol`.
2. Compile the tool using your TACPOL compiler.
3. Run the executable, providing input data and optional configuration.

## Example Configuration
```json
{
  "fields": [
    {
      "name": "email",
      "pattern": "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
    },
    {
      "name": "phone",
      "pattern": "\\d{3}-\\d{3}-\\d{4}"
    }
  ],
  "output_format": "json"
}
```
