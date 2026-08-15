# Enterprise Compliance Agent-Based Simulator

This project implements a multi-agent system using the Mesa framework to simulate enterprise compliance behaviors and policy enforcement dynamics.

## Features
- **Agent-Based Modeling**: Simulates autonomous agents representing employees, services, and auditors.
- **Behavioral Drift**: Models how agents drift from compliance and recover based on policy interventions.
- **Policy Enforcement**: Simulates the impact of different policy constraints on agent populations.
- **Statistical Analysis**: Aggregates agent states to measure macro-level compliance posture.
- **Integration**: Exports data for correlation with MARK-IV drift tracker and Modelica outputs.

## Installation
1. Clone the repository.
2. Install dependencies: `pip install mesa pandas numpy`
3. Run the simulation: `python main.py`

## Usage
- Configure agent parameters in `config.json`.
- Run simulations to test policy efficacy.
- Analyze output data for compliance trends.

## License
MIT
