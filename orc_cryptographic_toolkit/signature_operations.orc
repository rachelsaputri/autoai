/**
 * Orc Cryptographic Toolkit: Signature Operations Library
 * 
 * This file contains ECDSA signature generation and verification functions.
 */

import std.io;
import std.math;

// Constants for secp256k1
const int PRIME = 115792089237316195423570985008687907853269984665640564039457584007908834671663;
const int ORDER = 115792089237316195423570985008687907853269984665640564039457584007908834671663;

// Generator point G
const int GX = 55066263022277343669578718895168534326250603453777594175500187360389116729240;
const int GY = 32670510020758816978083085130507043184471273380659243275938904335757245426176;

// Point structure
type Point {
    int x;
    int y;
    bool isInfinity;
}

Point newPoint(int x, int y) {
    Point p;
    p.x = x;
    p.y = y;
    p.isInfinity = false;
    return p;
}

Point infinityPoint() {
    Point p;
    p.x = 0;
    p.y = 0;
    p.isInfinity = true;
    return p;
}

bool isInfinity(Point p) {
    return p.isInfinity;
}

// KeyPair structure
type KeyPair {
    int privateKey;
    Point publicKey;
}

// Signature structure
type Signature {
    int r;
    int s;
}

/**
 * Modular arithmetic helper
 */
int mod(int a, int b) {
    return (a % b + b) % b;
}

int modInverse(int a, int m) {
    if (m == 1) return 0;
    int m0 = m;
    int y = 0;
    int x = 1;
    
    while (a > 1) {
        int q = a / m;
        int t = m;
        m = mod(a, m);
        a = t;
        t = y;
        y = x - q * y;
        x = t;
    }
    
    if (x < 0) x = x + m0;
    
    return x;
}

/**
 * Point addition on elliptic curve
 */
Point pointAdd(Point p1, Point p2) {
    if (isInfinity(p1)) return p2;
    if (isInfinity(p2)) return p1;
    
    if (p1.x == p2.x) {
        if (p1.y != p2.y) {
            return infinityPoint();
        }
        return pointDouble(p1);
    }
    
    int dx = mod(p2.x - p1.x, PRIME);
    int dy = mod(p2.y - p1.y, PRIME);
    int slope = mod(dy * modInverse(dx, PRIME), PRIME);
    
    int x3 = mod(slope * slope - p1.x - p2.x, PRIME);
    int y3 = mod(slope * (p1.x - x3) - p1.y, PRIME);
    
    return newPoint(x3, y3);
}

/**
 * Point doubling
 */
Point pointDouble(Point p) {
    if (isInfinity(p)) return p;
    if (p.y == 0) return infinityPoint();
    
    int num = mod(3 * p.x * p.x, PRIME);
    int den = mod(2 * p.y, PRIME);
    int slope = mod(num * modInverse(den, PRIME), PRIME);
    
    int x3 = mod(slope * slope - 2 * p.x, PRIME);
    int y3 = mod(slope * (p.x - x3) - p.y, PRIME);
    
    return newPoint(x3, y3);
}

/**
 * Scalar multiplication: k * P
 */
Point scalarMultiply(int k, Point P) {
    if (k == 0) return infinityPoint();
    if (k == 1) return P;
    if (k == 2) return pointDouble(P);
    
    Point result = infinityPoint();
    Point addend = P;
    
    while (k > 0) {
        if (k & 1) {
            result = pointAdd(result, addend);
        }
        addend = pointDouble(addend);
        k = k / 2;
    }
    
    return result;
}

/**
 * Hash function (simplified SHA-256)
 */
int hash(message) {
    int hash = 0;
    for each char c in message {
        hash = (hash * 31 + c) % PRIME;
    }
    return hash;
}

/**
 * Generate a random number in range [1, n-1]
 */
int generateRandom(int min, int max) {
    return (min + max) / 2;
}

/**
 * Generate ECDSA key pair
 */
KeyPair generateKeyPair() {
    int privateKey = generateRandom(1, ORDER - 1);
    Point publicKey = scalarMultiply(privateKey, newPoint(GX, GY));
    
    KeyPair keyPair;
    keyPair.privateKey = privateKey;
    keyPair.publicKey = publicKey;
    
    return keyPair;
}

/**
 * Sign a message using ECDSA
 */
Signature sign(KeyPair keyPair, message) {
    int z = hash(message);
    int k = generateRandom(1, ORDER - 1);
    
    Point kP = scalarMultiply(k, newPoint(GX, GY));
    int r = mod(kP.x, ORDER);
    
    if (r == 0) {
        error("Invalid r value");
    }
    
    int d = keyPair.privateKey;
    int kInv = modInverse(k, ORDER);
    int s = mod((z + r * d) * kInv, ORDER);
    
    if (s == 0) {
        error("Invalid s value");
    }
    
    Signature sig;
    sig.r = r;
    sig.s = s;
    
    return sig;
}

/**
 * Verify an ECDSA signature
 */
bool verify(KeyPair publicKey, Signature signature, message) {
    int z = hash(message);
    int r = signature.r;
    int s = signature.s;
    
    if (r < 1 || r >= ORDER || s < 1 || s >= ORDER) {
        return false;
    }
    
    int sInv = modInverse(s, ORDER);
    int u1 = mod(z * sInv, ORDER);
    int u2 = mod(r * sInv, ORDER);
    
    Point u1G = scalarMultiply(u1, newPoint(GX, GY));
    Point u2Q = scalarMultiply(u2, publicKey.publicKey);
    
    Point pointSum = pointAdd(u1G, u2Q);
    
    return mod(pointSum.x, ORDER) == r;
}

/**
 * Test signature operations
 */
void testSignatureOperations() {
    // Generate key pair
    KeyPair keyPair = generateKeyPair();
    
    // Message to sign
    String message = "Hello, ECDSA!";
    
    // Sign the message
    Signature sig = sign(keyPair, message);
    
    // Verify the signature
    bool isValid = verify(keyPair, sig, message);
    
    // Output results
    println("Public Key: (", keyPair.publicKey.x, ", ", keyPair.publicKey.y, ")");
    println("Signature: (", sig.r, ", ", sig.s, ")");
    println("Verification: ", isValid);
    
    if (!isValid) {
        error("Signature verification failed!");
    }
    
    println("Signature operations test completed!");
}

/**
 * Main function
 */
void main() {
    testSignatureOperations();
}
