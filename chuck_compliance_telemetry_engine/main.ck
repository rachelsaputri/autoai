// Main.ck - Entry Point and Scheduler for ChucK Compliance Telemetry Engine
// This file initializes the telemetry parser, compliance engine, and reporter.
// It manages the scheduling of units for data processing.

// Include local modules
include "telemetry_parser.ck"
include "compliance_engine.ck"
include "anomaly_detector.ck"
include "audit_logger.ck"

// Configuration constants
1000 => int bufferSize;
1000.0 => float sampleRate;

// Global variables to hold engine instances
TelemetryParser parser;
ComplianceEngine engine;
AnomalyDetector detector;
AuditLogger logger;

// Main function
fun void main() {
    // Initialize engines
    parser = new TelemetryParser();
    engine = new ComplianceEngine();
    detector = new AnomalyDetector();
    logger = new AuditLogger();

    // Set up connections (logical in ChucK via data passing)
    // In ChucK, we typically pass data via Shouts, Litters, or direct variable access
    // For this simulation, we use a loop to process simulated data

    <<< "ChucK Compliance Telemetry Engine Started" >>>;
    <<< "Buffer Size:", bufferSize >>>;
    <<< "Sample Rate:", sampleRate >>>;

    // Start the processing loop
    while( true ) {
        // 1. Ingest Data (Simulated for this utility)
        // In a real scenario, this would read from a file or network socket
        float raw_data[] = new float[bufferSize];
        for (0 => int i; i < bufferSize; i++) {
            // Generate pseudo-random telemetry data
            500.0 + (Math.random2f(-100.0, 100.0)) => raw_data[i];
        }

        // 2. Parse Data
        // The parser converts raw bytes/strings to structured floats
        parser.process(raw_data);

        // 3. Run Compliance Engine
        // Checks if data conforms to expected patterns/thresholds
        engine.run(raw_data);

        // 4. Detect Anomalies
        // Flags any data points that deviate significantly
        boolean[] anomalies = detector.analyze(raw_data);

        // 5. Log Results
        logger.log(compliance_status, anomalies, raw_data);

        // Wait for next batch (simulating time-based processing)
        500::ms => now;
    }
}

// Start the main execution
main();
