# Mathematical & Cryptographic Algorithm Implementation

This project implements a fully functional **Extended Euclidean Algorithm** and **Modular Multiplicative Inverse** calculator in the **A+** programming language. It is designed for number-theoretic cryptographic operations such as RSA key generation steps or finite field arithmetic.

## Features
- Computes the greatest common divisor (GCD) of two large integers.
- Finds the Modular Multiplicative Inverse using the Extended Euclidean Algorithm.
- Handles negative results and non-invertible elements gracefully.
- Includes a demonstration/test case demonstrating the algorithm's correctness.

## Usage
Run the main script with two integer arguments:

```bash
./mathematical_crypto_algorithm/a0_main a0
```

Or execute it directly if the environment supports A+ execution natively.

## Algorithm Details
The implementation uses the **Extended Euclidean Algorithm** to solve the linear Diophantine equation:
`a * x + b * y = gcd(a, b)`

When `gcd(a, b) = 1`, `x` is the modular multiplicative inverse of `a` modulo `b`.

## License
MIT License
