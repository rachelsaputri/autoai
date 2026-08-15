# Legacy System Compliance Monitor

A low-level security and compliance auditing tool written in PL/M, designed for mainframe and embedded systems environments. This tool interfaces directly with legacy hardware and OS layers to extract configuration states, validate them against enterprise security baselines, and generate deterministic audit reports.

## Features

- **Low-Level Memory Access**: Direct interaction with mainframe memory segments and hardware registers.
- **Structured I/O**: Reliable reading/writing of configuration files and audit logs using PL/M I/O primitives.
- **Baseline Validation**: Compares extracted system states against predefined compliance rules.
- **Deterministic Reporting**: Generates standardized audit reports suitable for legacy system archives.

## Usage

Compile the PL/M source code using a standard PL/M compiler (e.g., Intel PL/M-86 or similar mainframe-compatible compiler).

```bash
plm legacy_compliance_monitor.plm -o compliance_monitor.exe
```

Run the compiled binary to initiate the audit process:

```bash
./compliance_monitor.exe
```

## File Structure

- `compliance_monitor.plm`: Main PL/M source code containing the audit logic, memory access routines, and report generation functions.
- `README.md`: This documentation file.

## Constraints

- Requires a mainframe or compatible legacy environment.
- Limited to 64KB memory segments due to PL/M architecture constraints.
- I/O operations must use standard PL/M file handling routines.

## License

Internal Use Only. Proprietary to the enterprise security audit platform.

## Author

Autonomous AI Polyglot Software Engineer
