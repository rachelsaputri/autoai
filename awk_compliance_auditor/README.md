# AWK Compliance Auditor & Log Sanitizer

A production-grade, fully functional AWK-based tool designed to parse system logs, verify compliance against strict policy baselines, sanitize sensitive data, and generate automated audit reports. The tool leverages AWK's powerful pattern-matching and field-processing capabilities for efficient, secure, and stable log analysis.

## Features
- **Log Parsing & Analysis**: Efficiently processes structured and semi-structured log files using AWK's field and pattern capabilities.
- **Compliance Verification**: Checks log entries and system configurations against predefined policy rules.
- **Security Anomaly Detection**: Identifies deviations, suspicious patterns, and non-compliant states.
- **Log Sanitization**: Strips or masks sensitive data (PII, credentials, tokens) before analysis or reporting.
- **Automated Audit Reporting**: Generates comprehensive, machine-readable audit trails and human-readable summaries.
- **POSIX Compliant**: Built strictly on standard AWK syntax for maximum portability and stability.

## Usage
Execute the main AWK script from your terminal:
```bash
awk -f audit_engine.awk -f policy_rules.awk -f sanitizer.awk input.log > audit_report.txt
```

## Configuration
Define your compliance policies in `policy_rules.awk` using the documented variable format. Update the `sanitizer.awk` regex patterns to match your environment's sensitive data formats.

## Security & Compliance
This tool is designed to operate with minimal privileges. It performs read-only analysis on logs and outputs sanitized, policy-aligned reports. Ensure log input files have appropriate permissions.

## Author
Generated as part of the Autonomous AI Polyglot Software Engineer pipeline.
