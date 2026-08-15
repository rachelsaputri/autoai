# Policy Effectiveness Analyzer

## Overview
The Policy Effectiveness Analyzer is a specialized tool built in ROOP designed to bridge the gap between theoretical policy verification and real-world enforcement. It ingests execution logs and remediation outcomes from the `remediation_orchestrator` and `response_orchestrator` to calculate efficacy scores, identify enforcement gaps, and provide feedback to the `averest_formal_policy_verifier`.

## Features
- **Log Ingestion**: Parses execution logs from response and remediation systems.
- **Efficacy Scoring**: Calculates success/failure rates for specific policy rules.
- **Discrepancy Detection**: Identifies cases where enforcement failed despite proof approval.
- **Feedback Generation**: Outputs reports to refine policy verification and enforcement logic.

## Architecture
- **Ingestion Layer**: Connects to orchestrator logs.
- **Analysis Engine**: Processes logs against policy definitions.
- **Feedback Loop**: Generates structured feedback for verification systems.

## Usage
1. Ensure logs from `remediation_orchestrator` and `response_orchestrator` are accessible.
2. Run the analyzer:
   ```bash
   ./policy_effectiveness_analyzer --log-dir /path/to/logs
   ```
3. Review the generated efficacy report.

## Integration
- **Input**: Action logs, remediation results.
- **Output**: Efficacy scores, discrepancy reports.
- **Feedback**: JSON reports for `averest_formal_policy_verifier`.

## License
Internal Use Only
