# Cilk Parallel Compliance Scanner

## Overview
The Cilk Parallel Compliance Scanner is a high-performance, production-grade tool designed to audit system integrity and verify compliance with organizational security policies. It leverages Cilk's parallel programming extensions (built on C/C++) to perform concurrent audits, significantly reducing processing time for large-scale system assessments.

This scanner is engineered to execute independent audit tasks in parallel using `cilk_spawn` and `cilk_sync`, ensuring optimal CPU utilization through Cilk's work-stealing scheduler. It generates deterministic results via race-free logic and produces tamper-proof audit logs.

## Features
- **Parallel Execution:** Leverages `cilk_spawn` and `cilk_sync` for high-performance concurrent processing.
- **System Auditing:** Scans file systems, validates file hashes, and checks system states against defined policies.
- **Tamper-Proof Logging:** Generates audit logs using thread-safe operations.
- **Customizable Policies:** Policies can be easily updated or extended in the `policies/` directory.
- **Detailed Reporting:** Outputs comprehensive compliance reports in JSON and CSV formats.

## Prerequisites
- A compiler supporting Cilk Plus (e.g., Intel C++ Compiler `icpc` or GCC with Cilk Plus support).
- Ensure the Cilk runtime libraries are installed and linked correctly.

## Installation
1. Clone the repository or copy the source files to your local environment.
2. Ensure your compiler supports Cilk extensions.

## Usage
Compile and run the scanner:

```bash
icpc -o compliance_scanner compliance_scanner.c -lcilkrts
./compliance_scanner
```

To specify a custom output directory:

```bash
./compliance_scanner --output /path/to/output
```

## Policy Configuration
Policies are defined in `policies/system_compliance_policy.c`. Ensure this file is present and contains valid rules for auditing.

## Architecture
- `compliance_scanner.c`: Main entry point for the parallel scanner.
- `audit_engine.c`: Contains the core logic for executing audit tasks.
- `policies/system_compliance_policy.c`: Defines the compliance rules and thresholds.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
