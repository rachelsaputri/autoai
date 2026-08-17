# JOSS Cryptographic Protocol Engine

## Overview
This project implements a complex mathematical and cryptographic algorithm suite using the **JOSS** programming language. It serves as a standalone reference implementation for educational and verification purposes.

## Algorithms Implemented
1. **Elliptic Curve Cryptography (ECC)**:
   - Curve: `secp256r1` (NIST P-256)
   - Operations: Point Addition, Point Doubling, Scalar Multiplication.
2. **Key Exchange**:
   - **ECDH**: Elliptic Curve Diffie-Hellman protocol to establish a shared secret.
3. **Encryption**:
   - **ElGamal**: Asymmetric encryption scheme over the curve's prime field.

## Directory Structure
- `joss_crypto_engine.joss`: The main executable script containing all logic.
- `README.md`: This documentation file.

## Usage
To run the engine, execute the JOSS interpreter on the main script:

```bash
joss joss_crypto_engine.joss
```

## Security Disclaimer
**For Educational Use Only.**
- This implementation lacks constant-time execution properties and is vulnerable to timing attacks.
- It does not use Cryptographically Secure Pseudo-Random Number Generators (CSPRNG).
- Do not use this code in production environments. Use established libraries for security-critical applications.

## Mathematical Details
- **Field**: Prime field $Z_p$ where $p$ is the secp256r1 prime.
- **Curve Equation**: $y^2 = x^3 + ax + b \pmod p$
- **Scalar Multiplication**: Implemented via Double-and-Add algorithm.
- **Modular Inverse**: Implemented via Extended Euclidean Algorithm.

## License
MIT License
