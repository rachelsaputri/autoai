# GameMonkey Compliance Auditor

A production-grade, fully functional compliance policy auditor implemented in GameMonkey Script. This tool is designed to ingest security configurations, validate them against a defined policy model, trigger compliance violations, and output structured audit results.

## Features

- **Policy Ingestion Engine**: Efficiently parses configuration data and policy definitions.
- **Stateful Compliance Validation**: Evaluates active security rules against the system state.
- **Automated Remediation Triggers**: Flags non-compliant artifacts and triggers remediation workflows.
- **Structured Audit Reports**: Generates actionable compliance summaries.
- **Robust Error Handling**: Ensures execution integrity and operational stability.

## Usage

1. Clone the repository.
2. Navigate to the `gameMonkey_compliance_auditor` directory.
3. Run the auditor script:
   ```bash
   gms run compliance_auditor.gms
   ```
4. Review the generated audit reports in the `reports` directory.

## Dependencies

- GameMonkey Script interpreter
- JSON parser module
- XML parser module

## License

MIT License
