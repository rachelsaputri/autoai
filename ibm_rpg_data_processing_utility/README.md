# IBM RPG Data Processing Utility

This utility provides a robust data processing framework built specifically for the IBM RPG (Report Program Generator) language. It is designed to run on IBM i (AS/400) systems and handles common data transformation, validation, and reporting tasks.

## Features
- **Data Ingestion**: Reads data from standard IBM i files (PF/DFU) and database tables.
- **Validation**: Enforces data integrity checks and business rules.
- **Transformation**: Applies business logic to transform raw data into target formats.
- **Reporting**: Generates audit logs and summary reports.

## File Structure
- `main.rpgle`: The entry point of the application.
- `parser.rpgle`: Handles data parsing and field extraction.
- `processor.rpgle`: Core business logic for data transformation.
- `validator.rpgle`: Data validation and integrity checks.
- `reporter.rpgle`: Report generation and logging.

## Prerequisites
- IBM i Access Client Solutions (ACS) or similar IDE.
- RPGLE compiler.
- Basic understanding of IBM i DDS (Data Description Specifications).

## How to Use
1. Ensure the RPGLE source members are added to your source physical file (e.g., `QSYS2/QRPGLESRC`).
2. Compile each module:
   ```cl
   CRTRPGMOD MODULE(lib/parser) SRCFILE(lib/qrpglesrc) SRCMBR(parser)
   CRTRPGMOD MODULE(lib/processor) SRCFILE(lib/qrpglesrc) SRCMBR(processor)
   CRTRPGMOD MODULE(lib/validator) SRCFILE(lib/qrpglesrc) SRCMBR(validator)
   CRTRPGMOD MODULE(lib/reporter) SRCFILE(lib/qrpglesrc) SRCMBR(reporter)
   CRTRPGMOD MODULE(lib/main) SRCFILE(lib/qrpglesrc) SRCMBR(main)
   ```
3. Link the program:
   ```cl
   CRTPGM PGM(lib/main) MODULE(lib/main lib/parser lib/processor lib/validator lib/reporter) BNDSRC(lib/bndsrc)
   ```
4. Run the program:
   ```cl
   CALL PGM(lib/main)
   ```

## License
Internal Use Only
