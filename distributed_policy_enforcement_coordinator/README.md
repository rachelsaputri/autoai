# Distributed Policy Enforcement Coordinator

A production-grade, fault-tolerant Erlang-based system designed to synchronize security policies across distributed nodes, validate cluster health, detect split-brain scenarios, and provide rigorous guarantees of consistency and fault tolerance.

## Features
- Distributed Policy Synchronization
- High-Availability Consensus
- Split-Brain Detection and Resolution
- Cluster Health Monitoring
- Fault-Tolerant Coordination

## Architecture
The system utilizes the BEAM Virtual Machine's inherent distribution capabilities, OTP behaviors (Supervisor, GenServer), and distributed Erlang features for node-to-node communication.

### Core Modules
- `distributed_policy_enforcement_coordinator.app`: Application definition.
- `main`: Entry point and node initialization.
- `dpe_coord`: Master coordination process.
- `dpe_policy_sync`: Policy synchronization logic.
- `dpe_health_monitor`: Cluster health validation.

## Usage
1. Compile the project using `rebar3 compile`.
2. Start nodes:
   ```bash
   rebar3 shell --name node1@127.0.0.1
   rebar3 shell --name node2@127.0.0.1
   ```
3. Initialize the coordinator on the primary node:
   ```erlang
   dpe_coord:start_link().
   ```

## Fault Tolerance
The system is designed to handle node failures gracefully. Supervisors restart crashed processes, and consensus mechanisms ensure data consistency even during network partitions.

## License
MIT License
