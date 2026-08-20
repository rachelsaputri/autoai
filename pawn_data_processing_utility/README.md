# Pawn Data Processing Utility

A complete, fully functional data processing utility written in Pawn for the Source engine (e.g., AMX Mod X, SourceMod).

## Features
- **Ingestion**: Loads data from JSON strings and simulated file-like structures.
- **Validation**: Checks data types and required fields.
- **Transformation**: Applies mathematical and string transformations.
- **Exporting**: Converts processed data back to JSON format.

## Files
- `main.pwn`: Entry point and core orchestration.
- `parser.pwn`: JSON parsing and data ingestion.
- `validator.pwn`: Data validation logic.
- `transformer.pwn`: Data transformation logic.
- `reporter.pwn`: Data exporting and reporting logic.

## Requirements
- Pawn Compiler (amxmodx or sourcemod)
- Required includes: `<amxmodx>`, `<amxmisc>`, `<json>` (if available, otherwise manual parsing is used)

## Usage
Compile the source code using the Pawn compiler. Include the resulting `.amxx` plugin in your server's `plugins` directory and add it to `plugins.ini`.

## License
MIT
