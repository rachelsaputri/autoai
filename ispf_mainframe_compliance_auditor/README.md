# ISPF Mainframe Compliance Auditor

## Overview
The **ISPF Mainframe Compliance Auditor** is a production-grade, interactive compliance auditing tool built strictly using ISPF. It is designed to run natively on z/OS systems, providing real-time dataset auditing, dynamic policy rule evaluation against mainframe security databases, automated compliance scoring, and remediation recommendations.

## Features
- **Interactive Panels**: Custom ISPF panels for intuitive user interaction and navigation.
- **REXX Exec Integration**: Robust REXX backend for policy evaluation, dataset analysis, and control logic.
- **Dynamic Policy Rules**: Evaluates compliance against configurable z/OS security policies (RACF, ACF2, Top Secret).
- **Real-Time Scoring**: Calculates and displays compliance scores based on predefined risk weights.
- **Remediation Engine**: Generates actionable, step-by-step remediation recommendations for policy violations.
- **Audit Trail Logging**: Maintains detailed, timestamped logs of all audit sessions and findings.

## Directory Structure
```
ispf_mainframe_compliance_auditor/
├── README.md
├── panels/
│   ├── AUDIT.pf
│   ├── RESULTS.pf
│   ├── POLICY.pf
│   └── HELP.pf
├── exec/
│   ├── main_audit.rex
│   ├── policy_eval.rex
│   ├── scorer.rex
│   ├── remediation.rex
│   └── audit_logger.rex
├── config/
│   ├── policy_rules.txt
│   ├── risk_weights.txt
│   └── defaults.cfg
└── lib/
    ├── audit_utils.rex
    └── report_generator.rex
```

## How to Build & Deploy
1. **Transfer Files to z/OS**: Ensure all source files are transferred to z/OS in ASCII format and placed in a PDS or PDSE (e.g., `USER.ISPF.EXEC` and `USER.ISPF.PANEL`).
2. **Compile/Load REXX Execs**: Use `ISPEXEC COMPILE` or bind the REXX scripts into a load library.
3. **Register Panels**: Load panels using the `ISPPROF` or by placing them in the system panel library.
4. **Customize Policy Rules**: Edit `config/policy_rules.txt` and `config/risk_weights.txt` to match your organization's compliance standards (NIST, ISO27001, HIPAA, etc.).
5. **Launch Application**: Run the main REXX exec or invoke via ISPF option menu.

## Usage
- Start the auditor by executing `MAIN_AUDIT`.
- Navigate through audit scopes using the interactive panels.
- Review real-time compliance scores and violation details.
- Generate and export remediation plans via the built-in reporter.

## Requirements
- z/OS environment with ISPF V6.1 or higher.
- Standard ISPF/REXX libraries.
- Appropriate RACF/ACF2/Top Secret authorities for dataset access.

## License
Internal Use Only. Distribution requires security team approval.

## Support
For issues or enhancement requests, contact the Mainframe Security Operations team.
