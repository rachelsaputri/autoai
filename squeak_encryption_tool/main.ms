// MicroScript implementation of a complex mathematical/cryptographic algorithm
// This file demonstrates a prime number generator and a simple encryption/decryption function.

import std/math
import std/crypto

function generate_primes(limit) {
    var sieve = []
    for (var i = 2; i <= limit; i++) {
        sieve[i] = true
    }
    for (var i = 2; i * i <= limit; i++) {
        if (sieve[i]) {
            for (var j = i * i; j <= limit; j += i) {
                sieve[j] = false
            }
        }
    }
    var primes = []
    for (var i = 2; i <= limit; i++) {
        if (sieve[i]) {
            primes.push(i)
        }
    }
    return primes
}

function encrypt(message, prime) {
    var encrypted = []
    for (var i = 0; i < message.length; i++) {
        var char_code = message.charCodeAt(i)
        var encrypted_char = (char_code * prime) % 256
        encrypted.push(String.fromCharCode(encrypted_char))
    }
    return encrypted.join('')
}

function decrypt(encrypted_message, prime) {
    var decrypted = []
    for (var i = 0; i < encrypted_message.length; i++) {
        var encrypted_char_code = encrypted_message.charCodeAt(i)
        var decrypted_char_code = (encrypted_char_code * modular_inverse(prime, 256)) % 256
        decrypted.push(String.fromCharCode(decrypted_char_code))
    }
    return decrypted.join('')
}

function modular_inverse(a, m) {
    var m0 = m
    var y = 0
    var x = 1

    if (m == 1) {
        return 0
    }

    while (a > 1) {
        var q = Math.floor(a / m)
        var t = m

        m = a % m
        a = t
        t = y

        y = x - q * y
        x = t
    }

    if (x < 0) {
        x = x + m0
    }

    return x
}

// Main execution
var primes = generate_primes(100)
var prime_key = primes[primes.length - 1]
var message = "Hello, MicroScript!"
var encrypted = encrypt(message, prime_key)
var decrypted = decrypt(encrypted, prime_key)

print("Original: " + message)
print("Encrypted: " + encrypted)
print("Decrypted: " + decrypted)
