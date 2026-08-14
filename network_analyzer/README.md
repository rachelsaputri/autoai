# Network Analyzer

## Overview
A high-performance network analysis tool built with Rust to replace legacy shell scripts. This module provides asynchronous port scanning capabilities with superior throughput and memory safety.

## Architecture
The core logic is implemented in `scanner.rs`, leveraging the `tokio` async runtime for non-blocking I/O operations. This allows for efficient scanning of multiple ports concurrently without the overhead of managing OS-level threads.

## Dependencies
- `tokio`: Async runtime for Rust.
- `tokio-util`: Additional utilities for async operations.

## Usage
Include the `scanner` module in your Rust project and use `scan_range` to identify open ports within a specified range.

## Safety
All network interactions are handled safely, preventing common vulnerabilities associated with lower-level network access.
