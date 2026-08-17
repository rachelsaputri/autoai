# System Integrity Monitor and Configuration Drift Detector

## Overview
This tool is a comprehensive system integrity monitor and configuration drift detector designed for Amiga E. It continuously scans system files, checks for unauthorized modifications, and compares current configurations against known secure baselines to detect drift.

## Features
- Real-time file integrity monitoring
- Secure baseline configuration storage and comparison
- Drift detection and alerting
- Secure logging of all detected changes
- Lightweight and optimized for Amiga E environments

## Usage
1. Compile the `sim_integrity_monitor.e` file using your Amiga E compiler.
2. Run the compiled executable with appropriate system privileges.
3. Configure the baseline paths and monitoring parameters in `config.cfg`.
4. Monitor the output log for integrity violations and drift alerts.

## License
This project is licensed under the MIT License.
