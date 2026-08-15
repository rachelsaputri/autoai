// main.ch - Execution entry point and orchestration driver
#include <stdio.h>
#include "enforcer.ch"
#include "reporter.ch"

int main() {
    printf("[INIT] Starting Ch-based Security Policy Enforcer...\n");
    
    // Initialize policy rules
    policy_rule_t rules[100];
    int rule_count = 0;
    load_baseline_policy(rules, &rule_count);
    printf("[INFO] Loaded %d baseline policies.\n", rule_count);
    
    // Prepare metrics array for reporting
    compliance_metric_t metrics[100];
    int metric_count = 0;
    
    // Execute enforcement cycle
    run_enforcement_cycle(rules, rule_count, metrics, &metric_count);
    printf("[INFO] Drift detection complete. Evaluated %d metrics.\n", metric_count);
    
    // Generate and output standardized compliance report
    printf("\n--- COMPLIANCE REPORT ---\n");
    generate_compliance_report(metrics, metric_count);
    printf("-------------------------\n");
    
    printf("[DONE] Enforcement cycle finalized successfully.\n");
    return 0;
}
