# Tea Security Diagnostic & Visualization Engine

A comprehensive interactive tool for auditing system security policies, diagnosing drift, and visualizing risk.

## Features
- **Policy Audit**: Validates system state against defined security policies.
- **Drift Detection**: Identifies deviations from baseline configurations.
- **Interactive Console**: Real-time diagnostic reporting and remediation commands.
- **Visualization**: ASCII-based visualization of security posture and topology.

## Usage

Compile and run the tool:
```bash
tea main.tea
```

## Structure
- `main.tea`: Entry point, initializes engines and starts interactive console.
- `auditEngine.tea`: Core logic for policy checking and compliance calculation.
- `diagnosticEngine.tea`: Logic for system state analysis and anomaly detection.
- `visualizer.tea`: ASCII art generation and formatting for reports.
