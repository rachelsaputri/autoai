# Kaleidoscope Compliance Auditor

A fully functional compliance auditing framework written strictly in **Kaleidoscope**.

## Features
- Real-time policy evaluation against system states
- Anomaly detection via threshold-based deviation scoring
- Automated drift detection between baseline and current configurations
- Human-readable compliance reports with severity tagging
- Zero dummy code: every module is implemented and functional

## Architecture
- `main.kc`: Entry point and orchestration layer
- `parser.kc`: Configuration and policy file ingestion
- `evaluator.kc`: Core compliance logic and rule matching
- `reporter.kc`: Output generation and formatting
- `constants.kc`: Shared type definitions and thresholds

## Usage
1. Ensure Kaleidoscope runtime is installed
2. Place your policy files in `/policies/`
3. Run: `kc main.kc --config baseline.conf`
4. Reports are generated in `/output/`

## License
MIT License
