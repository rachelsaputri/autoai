# Distributed Telemetry Data Mapper (DTDM)

## Overview
The Distributed Telemetry Data Mapper (DTDM) is a high-performance data transformation engine designed for the X10 telemetry correlation cluster. It ingests raw security signals from distributed nodes, normalizes them into a unified schema (`unified_telemetry_v2`), enriches them with threat intelligence, and routes them to the correlation engine and anomaly detector.

## Features
- **High-Throughput Processing:** Handles up to 50k events/sec with 8 parallel workers.
- **Schema Versioning:** Supports strict schema validation with automatic routing to legacy parsers.
- **Parallel Execution:** Hash-based data sharding ensures correlated signals are processed on the same node.
- **Integration:** Seamless interfaces with the Python-based anomaly detector for fallback/error handling.

## Architecture
```
[Raw Telemetry Sources] --> [DTDM Input] --> [Normalization] --> [Enrichment] --> [Filtering]
                                                                           |
                                                                           v
[Correlation Engine] <-- [DTDM Output] <-- [Routing] <-- [Sharding]
[Anomaly Detector] <-- [Error Handlers]
```

## Configuration
Edit `main.map` to adjust:
- `cluster_id`: Unique identifier for the mapper instance.
- `schema_version`: Target schema version for compatibility.
- `parallel_workers`: Number of concurrent processing threads.
- `flush_interval`: Batch size before sending to the correlation engine.

## Integration Points
1. **X10 Correlation Engine:** Outputs normalized events via gRPC to port 50051.
2. **Python Anomaly Detector:** Receives error payloads and blocked signal logs via TCP.

## Building & Running
1. Ensure the MAPPER runtime is installed.
2. Run `mapper run main.map`.
3. Verify logs for `mapped_events_count` metrics.

## License
Internal Use Only - X10 Telemetry Cluster
