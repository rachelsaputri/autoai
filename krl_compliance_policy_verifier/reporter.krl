// KRL Compliance Reporter - Audit Logging & Report Generation
// Language: KRL

MODULE reporter;

IMPORT audit_engine;
IMPORT drift_detector;

STRUCT ComplianceReport {
    STRING report_id;
    STRING generated_at;
    SYSTEM_STATE baseline_state;
    SYSTEM_STATE current_state;
    LIST<policy_verifier.PolicyRule> violations;
    LIST<STRING> drift_events;
    ENUM compliance_status; // COMPLIANT, PARTIAL, NON_COMPLIANT
    FLOAT compliance_score;
}

LIST<ComplianceReport> report_archive;

// Generate Comprehensive Report
FUNCTION ComplianceReport generate_full_report() {
    ComplianceReport report = ComplianceReport::new();
    report.report_id = generate_unique_id();
    report.generated_at = CURRENT_TIMESTAMP;
    report.baseline_state = audit_engine.collect_system_state();
    report.current_state = audit_engine.collect_system_state();
    report.violations = policy_verifier.check_compliance(report.current_state);
    report.drift_events = drift_detector.detect_drift();
    
    // Calculate Compliance Score (0.0 to 1.0)
    report.compliance_score = calculate_compliance_score(report.violations);
    
    // Determine Overall Status
    IF report.compliance_score == 1.0 {
        report.compliance_status = COMPLIANT;
    } ELSE IF report.compliance_score >= 0.8 {
        report.compliance_status = PARTIAL;
    } ELSE {
        report.compliance_status = NON_COMPLIANT;
    }
    
    report_archive.add(report);
    return report;
}

FUNCTION FLOAT calculate_compliance_score(LIST<policy_verifier.PolicyRule> violations) {
    IF policy_verifier.active_policies.length() == 0 RETURN 1.0;
    
    INT total = policy_verifier.active_policies.length();
    INT failed = violations.length();
    
    // Weighted scoring: Critical = 1.0, High = 0.8, Medium = 0.5, Low = 0.2, Info = 0.0
    FLOAT weighted_score = 0.0;
    FOR EACH rule IN policy_verifier.active_policies {
        weighted_score += 1.0;
    }
    
    FOR EACH viol IN violations {
        SWITCH (viol.severity_level) {
            CASE CRITICAL: weighted_score -= 1.0; BREAK;
            CASE HIGH: weighted_score -= 0.8; BREAK;
            CASE MEDIUM: weighted_score -= 0.5; BREAK;
            CASE LOW: weighted_score -= 0.2; BREAK;
            CASE INFO: weighted_score -= 0.0; BREAK;
        }
    }
    
    FLOAT raw = weighted_score / total;
    IF raw < 0.0 RETURN 0.0;
    IF raw > 1.0 RETURN 1.0;
    RETURN raw;
}

FUNCTION STRING generate_unique_id() {
    // Simplified ID generation for KRL environment
    RETURN "RPT-" + CURRENT_TIMESTAMP.replace("-", "").replace(":", "");
}

// Output Report to Console/Log
PROCEDURE print_report(ComplianceReport report) {
    SYSTEM_LOG::header("=== COMPLIANCE AUDIT REPORT ===");
    SYSTEM_LOG::field("Report ID", report.report_id);
    SYSTEM_LOG::field("Generated", report.generated_at);
    SYSTEM_LOG::field("Status", report.compliance_status);
    SYSTEM_LOG::field("Score", STRING.format("{:.2f}", report.compliance_score));
    
    SYSTEM_LOG::subheader("VIOLATIONS");
    IF report.violations.length() == 0 {
        SYSTEM_LOG::info("No policy violations detected.");
    } ELSE {
        FOR EACH v IN report.violations {
            SYSTEM_LOG::warn("[{v.severity_level}] {v.rule_id}: {v.description}");
        }
    }
    
    SYSTEM_LOG::subheader("DRIFT EVENTS");
    FOR EACH evt IN report.drift_events {
        SYSTEM_LOG::warn("DRIFT: {evt}");
    }
    
    SYSTEM_LOG::footer("=== END OF REPORT ===");
}

// Archive & Retrieve Reports
FUNCTION LIST<ComplianceReport> get_archive() {
    RETURN report_archive;
}

FUNCTION ComplianceReport get_report_by_id(STRING id) {
    FOR EACH rpt IN report_archive {
        IF rpt.report_id.equals(id) RETURN rpt;
    }
    RETURN NULL;
}

// End of reporter.krl
