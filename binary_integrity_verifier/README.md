# Binary Integrity & Signature Verifier

## Overview
The Binary Integrity & Signature Verifier is a low-level tool designed to analyze raw binary payloads, perform byte-level header inspection, calculate cryptographic checksums, and verify digital signatures against a trusted manifest. It detects tampering, validates structural integrity, and blocks execution of compromised binaries.

## Features
- **Byte-Level Header Inspection**: Manually parses ELF/PE headers to validate structural integrity.
- **Cryptographic Checksums**: Calculates SHA-256, MD5, and other supported hashes for binary validation.
- **Digital Signature Verification**: Verifies signatures against a trusted manifest using low-level cryptographic operations.
- **Tamper Detection**: Identifies unauthorized modifications or memory corruption in binary files.
- **Execution Block**: Prevents execution of binaries that fail integrity checks.

## Technical Details
- **Language**: Machine Code
- **Architecture**: Low-level binary parsing without high-level runtime abstractions.
- **Security**: Direct memory access techniques for precise validation.

## Usage
1. Compile the source code using a machine code compiler.
2. Run the executable with the binary file and manifest path as arguments.
3. Review the integrity report output.

## Integration
This tool is designed for integration into the firmware security pipeline. It can be used in CI/CD workflows to ensure binary integrity before deployment.

## License
MIT License
