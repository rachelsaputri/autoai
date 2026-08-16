# SP/k Compliance Analyzer

## Overview
This tool is a compliance analysis utility built strictly in SP/k. It is designed to evaluate system configurations against predefined policy rules, detect drift, and generate actionable remediation reports.

## Features
- Policy Rule Evaluation: Parses and executes compliance rules defined in SP/k syntax.
- Drift Detection: Compares current system state against a baseline.
- Remediation Reporting: Outputs structured reports detailing violations and suggested fixes.

## Usage
To run the compliance analyzer, execute the main SP/k script and provide the path to the policy configuration file:

```
./run.sh /path/to/policies.spk
```

## Project Structure
- `main.spk`: Entry point for the compliance analyzer.
- `policy_loader.spk`: Handles loading and parsing of policy files.
- `drift_engine.spk`: Core logic for state comparison and drift detection.
- `reporter.spk`: Generates human-readable compliance reports.

## License
Internal Use Only.
