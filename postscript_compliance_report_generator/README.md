# PostScript Compliance Report Generator

A fully functional, standalone PostScript-based tool designed to generate complex, structured compliance audit reports with embedded visualization charts (bar charts, pie charts, and audit trail tables). This utility operates natively in the PostScript interpreter without any external dependencies, making it ideal for legacy systems, embedded environments, or secure isolated networks.

## Features
- **Template Engine**: Dynamically generates structured PDF/PS output using PostScript operators.
- **Data Ingestion**: Accepts raw CSV or key-value compliance data streams.
- **Visualizations**: Renders native PostScript bar charts, risk gauges, and compliance matrices.
- **Signature Validation**: Implements basic cryptographic hashing (MD5/SHA1 via PostScript arrays) to verify report integrity.
- **Remediation Tracking**: Logs and prints actionable remediation steps with severity levels.

## Usage
1. Place your compliance data in a `.dat` or `.txt` file.
2. Run the tool via a PostScript interpreter:
   ```bash
   gs postscript_compliance_report_generator.ps -dNODISPLAY -c "(data.dat) run" -c quit
   ```
3. Output will be generated as `compliance_report.ps` (renderable to PDF via `ps2pdf`).

## Architecture
- `main.ps`: Entry point and interpreter bridge.
- `parser.ps`: Data ingestion and normalization.
- `engine.ps`: Report formatting and state machine logic.
- `visualizer.ps`: Chart and graph rendering primitives.
- `validator.ps`: Integrity checks and cryptographic hashing.

## Constraints
- Pure PostScript (Level 2/3 compatible).
- No external libraries or scripts.
- Fully deterministic and reproducible output.

## License
MIT License. Use freely in compliant environments.
