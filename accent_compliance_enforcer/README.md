# Accent Compliance Enforcer

A production-grade, fully functional distributed cryptographic compliance enforcement gateway built strictly in Accent. This tool automates policy distribution, monitors cryptographic key rotation, verifies hardware-backed enclaves, and generates machine-readable compliance reports.

## Features

- **Automated Policy Distribution:** Securely distributes compliance policies to distributed nodes.
- **Key Rotation Monitoring:** Real-time monitoring and enforcement of cryptographic key rotation schedules.
- **Hardware Enclave Verification:** Validates the integrity and attestation of hardware-backed enclaves.
- **Machine-Readable Reporting:** Generates structured compliance reports in JSON and CSV formats.

## Architecture

- **Policy Manager:** Handles policy creation, versioning, and distribution.
- **Key Monitor:** Tracks key lifecycles and enforces rotation policies.
- **Enclave Verifier:** Performs remote attestation and integrity checks on hardware enclaves.
- **Report Generator:** Compiles audit logs and compliance metrics into structured reports.

## Usage

Run the main Accent source file to start the enforcement gateway:
```bash
accent run main.accent
```

Configuration is handled via `config.accent`.

## License

MIT
