# CDuce Self-Healing Tool Agent

## Overview
The CDuce Self-Healing Tool is a robust, type-safe system monitoring and remediation engine written in CDuce. It implements a continuous loop of health checks, anomaly detection, and automated remediation strategies to maintain system integrity.

## Features
- **Real-time Health Monitoring**: Simulates complex system metrics (CPU, Memory, Disk, Network, Service Availability).
- **Automated Anomaly Detection**: Evaluates health checks against strict thresholds to determine system status (HEALTHY, DEGRADED, CRITICAL, HEALING).
- **Intelligent Remediation**: Selects and executes appropriate remediation actions based on the severity of detected issues.
- **Resilient Looping**: Implements a safe healing loop with configurable maximum iterations to prevent infinite loops.
- **Strict Type Safety**: Leverages CDuce's powerful type system to ensure data consistency and prevent runtime type errors.

## Files
- `CDuce_SelfHealing_Agent.cduce`: The main source code containing all logic.

## How to Run
1. Ensure CDuce is installed and available in your system PATH.
2. Execute the tool using the CDuce interpreter:
   ```bash
   cduce CDuce_SelfHealing_Agent.cduce
   ```

## Logic Breakdown
1. **Health Checks**: The engine periodically simulates fetching system metrics and evaluates them against predefined thresholds.
2. **Status Evaluation**: Based on the results, the system transitions between states (HEALTHY -> DEGRADED -> CRITICAL).
3. **Remediation**: If the system is not HEALTHY, the engine selects appropriate actions (e.g., restart service, purge cache, rotate logs) and applies them.
4. **Healing Loop**: The process repeats until the system reaches a HEALTHY state or the maximum number of iterations is reached.

## Extensibility
- New health checks can be added by modifying the `execute_health_checks` function.
- New remediation strategies can be implemented by extending the `RemediationAction` type and the `select_remediation` logic.
- Thresholds and limits can be easily adjusted for different system environments.
