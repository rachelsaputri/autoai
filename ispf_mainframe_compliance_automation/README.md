# ISPF Mainframe Compliance Automation

## Overview
This tool provides a comprehensive framework for automating compliance audits and policy enforcement within IBM Mainframe environments using ISPF panels and REXX scripts. It integrates with standard mainframe systems (z/OS) to continuously monitor configurations, detect drift, and generate actionable compliance reports.

## Architecture
- **Main Entry Point (`main.rexx`)**: Orchestrates the ISPF panel navigation and session lifecycle.
- **Audit Engine (`audit_engine.rexx`)**: Queries system datasets, checks user profiles, and validates security settings against defined baselines.
- **DRIFT DETECTOR (`drift_detector.rexx`)**: Compares current system state against a stored baseline and flags non-compliant entries.
- **Reporter (`reporter.rexx`):** Generates formatted compliance reports in ASCII, PDF-compatible formats, or JCL-friendly spool outputs.
- **ISPF Panels (`panels/`)**: User-friendly TSO/ISPF interfaces for interaction.

## Setup
1. **Prerequisites**: IBM z/OS environment with ISPF 6.4+ and REXX support enabled.
2. **Deployment**:
   - Upload all `.rexx` files to a PDS (e.g., `MYLIB.REXX.PROG`).
   - Place ISPF panels in the panel library referenced by `ISPPLIB`.
   - Place ISPF messages in the message library referenced by `ISPSLIB`.
3. **Configuration**: Edit `config.cfg` to specify baseline dataset names, target security classes (e.g., RACF/AUTHINFO), and reporting thresholds.

## Usage
- Invoke the tool from the TSO command line: `ISPEXEC LINK main.rexx`
- Navigate through the interactive menu to run audits, view drift, or export reports.
- Use automated scheduling via JCL for periodic compliance checks.

## Notes
- Always test in a non-production environment first.
- Ensure appropriate RACF/AUTHINFO access is granted to the execution user ID.
- This tool assumes standard mainframe security practices and may require customization for proprietary or heavily customized environments.
