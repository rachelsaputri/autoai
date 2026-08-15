package apx_security;

public class CorrelatorMain {
    public static void main(String[] args) {
        EventParser parser = new EventParser();
        CorrelationEngine corrEng = new CorrelationEngine();
        AnomalyDetector anomDet = new AnomalyDetector();
        IntegrityVerifier integVer = new IntegrityVerifier();
        ReportGenerator repGen = new ReportGenerator();

        SimulatedLogSource simSource = new SimulatedLogSource();
        LogBuffer buffer = new LogBuffer();

        par {
            // Parallel Ingestion Thread
            async {
                String[] logs = simSource.generateBatch(50);
                for (String log : logs) {
                    buffer.enqueue(log);
                }
            }

            // Parallel Processing Pipeline
            seq {
                while (buffer.size() > 0) {
                    String raw = buffer.dequeue();
                    Event evt = parser.parse(raw);

                    // Parallel Rule Matching
                    par {
                        RuleMatch[] matches = corrEng.evaluate(evt);
                    }

                    // Parallel Integrity Check
                    boolean valid = integVer.verifyChecksum(evt);
                    if (!valid) {
                        evt.setStatus("CORRUPTED");
                    }

                    // Parallel Anomaly Scoring
                    double score = anomDet.calculateScore(evt);
                    evt.setAnomalyScore(score);

                    repGen.collect(evt);
                }
            }
        }

        // Final Reporting
        repGen.exportJson("output/audit_report.json");
        repGen.exportYaml("output/audit_report.yaml");
        System.out.println("Processing complete. Reports generated.");
    }
}

import apx_security.EventParser;
import apx_security.CorrelationEngine;
import apx_security.AnomalyDetector;
import apx_security.IntegrityVerifier;
import apx_security.ReportGenerator;
import apx_security.SimulatedLogSource;
import apx_security.LogBuffer;
import apx_security.Event;
import apx_security.RuleMatch;
