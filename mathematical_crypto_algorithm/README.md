# Mathematical Cryptographic Algorithm Implementation

This project implements a fully working cryptographic algorithm using COBOL, designed for secure key generation and data encryption.

## Features
- RSA Key Pair Generation
- RSA Encryption/Decryption
- Modular Arithmetic
- Exponentiation by Squaring

## Algorithm Details
The implementation uses the RSA (Rivest-Shamir-Adleman) algorithm, which relies on the difficulty of factoring large prime numbers.

## Files
- `main.cbl`: Main program implementing key generation, encryption, and decryption.

## Compilation
Compile using GnuCOBOL:
`cobc -free -o crypto_alg main.cbl`

## Usage
Run the compiled program to generate keys, encrypt a sample message, and decrypt it back to verify correctness.
