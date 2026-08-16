# Compliance Analysis Utility (Squirrel)

This is a standalone compliance analysis utility written strictly in Squirrel. It is designed to parse configuration files, evaluate them against predefined policy rules, and generate detailed compliance reports.

## Features
- Policy rule evaluation engine
- Configuration file parsing (INI, JSON, YAML)
- Anomaly and drift detection
- Automated report generation
- Extensible rule system

## Getting Started
1. Ensure Squirrel is installed and available in your system PATH.
2. Navigate to the `src` directory.
3. Run the main entry point: `squirrel main.nut`
4. Place your configuration files in the `configs` directory.
5. Review the generated reports in the `reports` directory.

## Project Structure
- `src/`: Contains the core Squirrel source files.
- `configs/`: Directory for target configuration files to audit.
- `reports/`: Directory where compliance reports are generated.
- `policies/`: Directory containing policy definition files.

## License
MIT License
