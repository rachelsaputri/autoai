# Clojure Mainframe Compliance Engine

A production-grade, high-performance mainframe system administration compliance verification and batch job auditing engine built entirely in Clojure.

## Overview

This tool leverages Clojure's immutable data structures, functional paradigms, and efficient concurrency models to provide robust compliance verification for mainframe environments. It dynamically parses system configuration parameters, validates batch job control blocks (JCL), and ensures resource allocation and security permissions align with formal compliance constraints.

## Features

*   **Immutable Data Integrity**: Utilizes Clojure's core data structures (Vectors, Maps, Sets) to ensure data consistency and thread-safety without explicit synchronization locks.
*   **Formal Compliance Constraints**: Implements a rule-based engine to validate configurations against enterprise-defined policy constraints.
*   **Tamper-Proof Audit Trails**: Maintains persistent, append-only logs of all compliance checks and remediation actions.
*   **Concurrency**: Uses Clojure agents and futures for non-blocking, high-throughput validation of large datasets.
*   **Reporting**: Generates standardized compliance reports in JSON and CSV formats.
*   **Certificate Generation**: Produces machine-readable mainframe compliance certificates upon successful verification.

## Project Structure

```
clojure_mainframe_compliance_engine/
├── README.md
├── project.clj
├── src/
│   └── clojure_mainframe_compliance_engine/
│       ├── core.clj
│       ├── parser.clj
│       ├── validator.clj
│       ├── auditor.clj
│       └── reporter.clj
└── resources/
    └── policies/
        ├── system_config_policy.json
        └── batch_job_policy.json
```

## Prerequisites

*   Java 8 or higher
*   Leiningen (Clojure build tool)

## Installation

1.  Clone this repository.
2.  Install dependencies:
    ```bash
    lein deps
    ```

## Usage

Run the engine:
```bash
lein run -m clojure_mainframe_compliance_engine.core
```

### Input Configuration

Place your system configuration and policy files in the `resources/policies/` directory. The engine expects JSON-formatted policies for validation rules.

### Output

*   `audit_log.clj`: Persistent Clojure data structure containing the audit trail.
*   `compliance_report.json`: JSON report of compliance status.
*   `compliance_report.csv`: CSV report for spreadsheet analysis.
*   `compliance_certificate.json`: Machine-readable certificate of compliance.

## Development

To start a REPL with all dependencies loaded:
```bash
lein repl
```

## License

MIT License
