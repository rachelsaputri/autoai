# Data Processing Utilities

This module provides a set of Perl-based utilities for data processing, including CSV and JSON processing, and text sanitization.

## Components

- **CsvProcessor.pl**: Handles CSV file processing.
- **JsonProcessor.pl**: Handles JSON file processing.
- **TextSanitizer.pl**: Sanitizes text data by removing control characters and normalizing whitespace.
- **main.pl**: Main entry point for running the utilities.

## Usage

1. Ensure you have the required Perl modules installed: `Text::CSV` and `JSON::PP`.
2. Run the main script with an input file:

   ```bash
   perl main.pl input.csv output.txt
   ```

   or

   ```bash
   perl main.pl input.json output.json
   ```

## Requirements

- Perl 5.10 or higher
- `Text::CSV` module
- `JSON::PP` module

## License

MIT License
