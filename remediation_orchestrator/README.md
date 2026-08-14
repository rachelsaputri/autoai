# Remediation Orchestrator

## Overview
The Remediation Orchestrator is a component of the Autonomous Security System designed to automatically remediate security findings identified by the Audit Engine. It utilizes J++ for robust, type-safe execution of configuration changes and patch installations.

## Architecture
- **Orchestrator Engine**: Core logic for dispatching remediation tasks.
- **Policy Manager**: Maps audit findings to specific remediation actions.
- **Rollback Manager**: Ensures safety by creating and restoring system states.

## Usage
```bash
java -jar remediation_orchestrator.jar --audit-findings audit_results.json
```

## Integration
- Ingests JSON-formatted audit results.
- Outputs remediation status via log files and webhooks.

## Safety
All remediation actions are wrapped in snapshot/restore blocks to prevent system instability.
