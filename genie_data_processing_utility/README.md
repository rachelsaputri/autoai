# Genie Data Processing Utility

## Overview

This project provides a robust data processing utility built using the Genie programming language (a high-level, statically-typed programming language that targets the GNOME/GTK+ stack and uses the Vala compiler).

## Features

- **Data Ingestion**: Efficiently reads and processes data from various sources.
- **Transformation**: Applies configurable transformation rules to data.
- **Validation**: Ensures data integrity and compliance with schema definitions.
- **Reporting**: Generates detailed reports on processing results.

## Dependencies

- Vala Compiler (`valac`)
- GObject Introspection Runtime
- JSON-Glib (for JSON parsing)
- GLib and GObject

## Installation

1. Ensure Vala and required libraries are installed:
   ```bash
   sudo apt-get install valac libglib2.0-dev libjson-glib-dev
   ```

2. Clone the repository:
   ```bash
   git clone <repository-url>
   cd genie_data_processing_utility
   ```

3. Compile the utility:
   ```bash
   valac -o dpu main.gs data_engine.gs processor.gs validator.gs reporter.gs
   ```

## Usage

Run the compiled binary:
```bash
./dpu --input <data_file.json> --output <report_file.txt>
```

## License

MIT License
