# Cilk Parallel Compliance Scanner

A high-performance, parallelized compliance scanning engine built with Intel Cilk. 

## Features
- Concurrent Multi-Core Log Processing: Leverages Cilk's work-stealing scheduler to ingest and process logs across multiple CPU cores simultaneously.
- Parallel Policy Rule Evaluation: Evaluates compliance rules against massive datasets in parallel using `cilk_spawn`.
- Real-Time Risk Aggregation: Aggregates risk scores and audit results with `cilk_sync` to ensure data integrity.
- Automated Remediation Orchestration: Triggers remediation workflows in parallel when critical violations are detected.

## Requirements
- Intel Cilk Plus Compiler (e.g., `g++` with `-fcilkplus` or ICC)
- Linux/macOS

## Usage
```bash
g++ -O2 -fcilkplus -o scanner main.cilk
echo "192.168.1.1:22 allowed" | ./scanner
echo "192.168.1.1:22 blocked" | ./scanner
```

## Architecture
- `main.cilk`: Entry point, configuration loading, and orchestration.
- `log_ingestor.cilk`: Parallel parsing of log entries.
- `policy_engine.cilk`: Concurrent evaluation of security policies.
- `risk_aggregator.cilk`: Merging of risk scores across threads.
- `remediator.cilk`: Parallel remediation actions.

## License
MIT
