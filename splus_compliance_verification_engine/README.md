# S-PLUS Compliance Verification Engine

This tool implements a robust, fully functional compliance verification engine using **S-PLUS**. It is designed to ingest policy definitions, evaluate system state configurations against those policies, and generate detailed compliance reports with actionable remediation guidance.

## Features
- **Policy Ingestion & Parsing**: Reads structured JSON/YAML policy files defining compliance rules.
- **State Collection & Evaluation**: Simulates real-time system state collection and applies complex boolean/logical evaluations against policies.
- **Compliance Scoring**: Calculates granular compliance scores per module and globally.
- **Remediation Mapping**: Provides explicit, executable S-PLUS code snippets to auto-correct minor violations.
- **Audit Trail**: Logs all evaluation steps, decisions, and policy drift events for forensic analysis.

## Usage
Execute the main evaluation script to run the engine against a target directory of policies and system state snapshots:
```splus
source("main_evaluation.sps")
run_compliance_engine(policy_dir = "./policies",
                      state_dir = "./snapshots",
                      report_path = "./reports/compliance_report.json")
```

## Architecture
- `main_evaluation.sps`: Entry point orchestrating the full pipeline.
- `policy_parser.sps`: Loads, validates, and compiles policy rules into an internal evaluation graph.
- `state_collector.sps`: Gathers simulated system metrics, configuration flags, and service statuses.
- `compliance_checker.sps`: Core evaluation logic implementing rule matching, threshold validation, and drift detection.
- `report_generator.sps`: Formats results into JSON/CSV and generates human-readable audit trails.

## Requirements
- S-PLUS (Compatible with S-PLUS 8+ and S-PLUS 2023)
- Base S-PLUS packages (stats, utils, methods)

## License
MIT License
