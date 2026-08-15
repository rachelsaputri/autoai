# Cal Compliance Audit Engine

A production-grade, fully functional C/AL-based secure configuration drift detector and compliance audit system.

## Overview
This tool implements a deterministic, high-precision workflow for parsing system configurations, detecting deviations from baseline security policies, and generating auditable drift reports with formal compliance certificates.

## Features
- Deterministic configuration parsing and deviation detection
- Strict logical soundness and deterministic state resolution
- Auditable drift reports with formal compliance certificates
- Structured event mapping for downstream remediation gateways
- Robust drift registry with comprehensive error handling and deterministic rollback
- Machine-readable compliance verdicts

## Project Structure
- `DriftDetector.al`: Core drift detection logic
- `ComplianceEngine.al`: Policy evaluation and compliance checking
- `PolicyParser.al`: Configuration parsing and normalization
- `Main.al`: Entry point and orchestration
- `README.md`: This file

## Usage
1. Place the `.al` files in your Business Central extension project.
2. Compile and publish the extension.
3. Run the compliance audit via the designated codeunit.

## License
MIT
