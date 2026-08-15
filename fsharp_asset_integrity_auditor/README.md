# Cross-Platform Asset Integrity and Policy Drift Auditor

## Overview
This tool is a production-grade, F#-based utility designed to audit digital assets across various platforms. It performs cryptographic verification of assets, detects policy drift over time, and generates structured audit trails for SIEM integration.

## Features
- Recursive filesystem traversal for asset discovery.
- Cryptographic hashing for integrity verification.
- Policy drift analysis over time.
- Automated alert generation for anomalies.
- Structured JSON and XML output for audit trails.

## Prerequisites
- .NET 6.0 SDK or later.

## Project Structure
- `src/`: Contains the core F# source code.
  - `AssetIntegrityAuditor.fsproj`: The main project file.
  - `Program.fs`: The entry point of the application.
  - `FileUtils.fs`: Utilities for filesystem operations.
  - `Crypto.fs`: Cryptographic functions for hashing and verification.
  - `PolicyEngine.fs`: Logic for policy parsing and drift detection.
  - `AuditLogger.fs`: Functions for generating audit logs in JSON and XML.
- `config/`: Contains configuration files.
  - `policy_config.json`: Policy rules for drift detection.
- `tests/`: Contains unit tests for the core modules.

## Usage
1. Clone the repository.
2. Build the project using `dotnet build`.
3. Run the application using `dotnet run -- <path_to_asset_directory> <policy_config.json>`.

## License
MIT License
