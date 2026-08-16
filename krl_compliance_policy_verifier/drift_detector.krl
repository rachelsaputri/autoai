// KRL Compliance Drift Detector - Baseline Comparison & Trend Analysis
// Language: KRL

MODULE drift_detector;

IMPORT audit_engine;

// Baseline Storage
STRUCT ComplianceBaseline {
    STRING timestamp;
    SYSTEM_STATE snapshot;
    LIST<policy_verifier.PolicyRule> active_violations;
}

LIST<ComplianceBaseline> baseline_history;

// Establish Initial Baseline
PROCEDURE establish_baseline() {
    SYSTEM_STATE snapshot = audit_engine.collect_system_state();
    LIST<policy_verifier.PolicyRule> violations = policy_verifier.check_compliance(snapshot);
    
    ComplianceBaseline base = ComplianceBaseline::new();
    base.timestamp = CURRENT_TIMESTAMP;
    base.snapshot = snapshot;
    base.active_violations = violations;
    
    baseline_history.clear();
    baseline_history.add(base);
    
    SYSTEM_LOG::info("Compliance Baseline Established at {base.timestamp}");
}

// Detect Configuration Drift
FUNCTION LIST<STRING> detect_drift() {
    LIST<STRING> drift_events = LIST<STRING>::new();
    
    IF baseline_history.length() == 0 {
        SYSTEM_LOG::error("No baseline established. Run establish_baseline first.");
        drift_events.add("FATAL: No baseline found");
        RETURN drift_events;
    }
    
    ComplianceBaseline ref = baseline_history.last();
    SYSTEM_STATE current = audit_engine.collect_system_state();
    
    // Compare critical immutable attributes
    IF !ref.snapshot.system.hostname.equals(current.system.hostname) {
        drift_events.add("HOSTNAME_CHANGED: {ref.snapshot.system.hostname} -> {current.system.hostname}");
    }
    
    IF ref.snapshot.security.access_model != current.security.access_model {
        drift_events.add("ACCESS_MODEL_CHANGED: {ref.snapshot.security.access_model} -> {current.security.access_model}");
    }
    
    IF ref.snapshot.network.open_ports != current.network.open_ports {
        drift_events.add("NETWORK_PORT_CHANGE: Detected difference in open ports.");
    }
    
    // Compare compliance state
    LIST<policy_verifier.PolicyRule> current_violations = policy_verifier.check_compliance(current);
    IF current_violations.length() > ref.active_violations.length() {
        drift_events.add("COMPLIANCE_DEGRADATION: Violations increased from {ref.active_violations.length()} to {current_violations.length()}");
    }
    
    IF drift_events.length() > 0 {
        SYSTEM_LOG::warn("Drift Detected. Event Count: {drift_events.length()}");
        update_baseline_with_new_snapshot(current, current_violations);
    }
    
    RETURN drift_events;
}

// Update Baseline History with Recent Snapshot
PROCEDURE update_baseline_with_new_snapshot(SYSTEM_STATE snap, LIST<policy_verifier.PolicyRule> viols) {
    ComplianceBaseline entry = ComplianceBaseline::new();
    entry.timestamp = CURRENT_TIMESTAMP;
    entry.snapshot = snap;
    entry.active_violations = viols;
    
    baseline_history.add(entry);
    
    // Maintain rolling window of last 100 baselines
    IF baseline_history.length() > 100 {
        baseline_history.remove(0);
    }
}

FUNCTION INT get_baseline_count() {
    RETURN baseline_history.length();
}

FUNCTION COMPLIANCE_TREND calculate_trend() {
    INT count = baseline_history.length();
    IF count < 2 RETURN STABLE;
    
    ComplianceBaseline first = baseline_history.first();
    ComplianceBaseline last = baseline_history.last();
    
    IF last.active_violations.length() > first.active_violations.length() {
        RETURN DECLINING;
    } ELSE IF last.active_violations.length() < first.active_violations.length() {
        RETURN IMPROVING;
    }
    RETURN STABLE;
}

// End of drift_detector.krl
