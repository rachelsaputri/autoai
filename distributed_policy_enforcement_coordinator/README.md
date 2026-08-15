# Distributed Policy Enforcement Coordinator

A distributed policy enforcement coordinator built with Erlang. It manages a cluster of policy enforcement agents, routes compliance tasks via message passing, handles node failures gracefully, and aggregates remediation actions across the distributed network using Erlang's concurrent actor model and fault-tolerant OTP behaviors.

## Features

- **Distributed Agent Management**: Manage a cluster of policy enforcement agents.
- **Message Passing**: Route compliance tasks and remediation actions via Erlang message passing.
- **Fault Tolerance**: Handle node failures gracefully using Erlang's supervision trees.
- **Aggregation**: Aggregate remediation actions across the distributed network.

## Installation

1. Clone the repository.
2. Build the project using `rebar3`.
3. Start the coordinator.

## Usage

1. Start the coordinator.
2. Register agents.
3. Send policy enforcement tasks.
4. Monitor and manage the cluster.
