# KSH Configuration Drift Monitor

## Overview
The `ksh_config_drift_monitor` is a production-grade, fully automated system configuration drift detection and compliance enforcement utility written strictly in Korn Shell (ksh). This tool is designed to snapshoot critical system configurations, compute cryptographic hashes, compare them against approved baselines, and generate structured compliance reports with detailed deviation logging.

## Architecture
The project is modular, leveraging ksh's advanced capabilities (arrays, mathematical evaluation, error trapping, and secure temporary file handling) to ensure reliability and portability across Unix-like environments.

### Core Modules
- `main.ksh`: Entry point, orchestrates the workflow, handles command-line argument parsing, and invokes modules.
- `drift_detector.ksh`: Implements the core snapshot, hash computation, and comparison logic.
- `compliance_validator.ksh`: Validates system state against approved baseline policies and thresholds.
- `reporter.ksh`: Generates structured compliance reports in JSON and human-readable formats, logs deviations.

## Usage
1. Ensure `ksh` is installed and executable on the target system.
2. Place the approved baseline configuration in the `./baselines/` directory.
3. Execute the main script with appropriate flags:
   ```bash
   ./main.ksh --mode snapshot --output ./reports
   ./main.ksh --mode validate --baseline ./baselines/approved.conf --output ./reports
   ```
4. Review generated reports in the `./reports/` directory.

## Security & Best Practices
- All temporary files are created in secure, restricted permissions directories (`/tmp/ksh_drift_$$`).
- Robust `trap` handlers ensure cleanup of temporary files and resources on exit or interruption.
- Strict error handling via `set -e` and custom error trapping functions.
- No external dependencies beyond standard POSIX utilities and `ksh` built-ins.

## License
Internal Use Only - Do Not Distribute

## Author
Autonomous AI Polyglot Software Engineer
