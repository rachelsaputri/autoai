# Squeak Encryption Tool

## Description
This tool implements a complex mathematical and cryptographic algorithm using MicroScript. It includes a prime number generator and a simple encryption/decryption function.

## Features
- **Prime Number Generation**: Efficiently generates prime numbers up to a specified limit using the Sieve of Eratosthenes algorithm.
- **Encryption**: Encrypts a given message using a prime number as a key.
- **Decryption**: Decrypts an encrypted message back to its original form using modular inverse.

## Usage
To use this tool, you can run the `main.ms` file in a MicroScript environment. The tool will generate prime numbers, encrypt a sample message, and then decrypt it to demonstrate the functionality.

## Code Structure
- **generate_primes**: Generates prime numbers up to a specified limit.
- **encrypt**: Encrypts a message using a prime number as a key.
- **decrypt**: Decrypts an encrypted message using the modular inverse of the prime number.
- **modular_inverse**: Calculates the modular inverse of a number.

## Example
```javascript
var primes = generate_primes(100)
var prime_key = primes[primes.length - 1]
var message = "Hello, MicroScript!"
var encrypted = encrypt(message, prime_key)
var decrypted = decrypt(encrypted, prime_key)

print("Original: " + message)
print("Encrypted: " + encrypted)
print("Decrypted: " + decrypted)
