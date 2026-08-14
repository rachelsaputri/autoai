# Alert Dispatch Engine

A high-performance, real-time alert prioritization and dispatch engine designed to dynamically score normalized security signals against live threat intelligence feeds and route critical incidents to the response orchestrator.

## Features
- Dynamic risk scoring algorithms based on context and feed data.
- Risk-based routing logic for tiered alert handling.
- High-throughput queue management for signal processing.
- Seamless integration with the X10 correlation engine and mapped telemetry schema.
- Configurable severity thresholds and routing policies.

## Architecture
The engine consumes normalized security signals, applies scoring heuristics, and dispatches alerts via async message queues. It integrates with the existing response orchestrator for automated remediation.

## Configuration
Environment variables or a configuration file (YAML/JSON) controls feed URLs, scoring weights, and routing targets.

## Usage
Build and run the engine to start consuming signals from the telemetry mapper.
