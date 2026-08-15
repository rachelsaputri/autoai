// enforcer.ch - Core engine for policy parsing, drift detection, and enforcement
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.ch"
#include "reporter.ch"

typedef struct {
    char name[64];
    int value;
} policy_rule_t;

/**
 * Loads baseline policies from a structured representation.
 */
void load_baseline_policy(policy_rule_t* rules, int* count) {
    strcpy(rules[0].name, "firewall_enabled");
    rules[0].value = 1;
    
    strcpy(rules[1].name, "max_connections");
    rules[1].value = 1000;
    
    strcpy(rules[2].name, "ssh_root_login");
    rules[2].value = 0;
    
    *count = 3;
}

/**
 * Simulates fetching current system state for comparison.
 */
void fetch_system_state(config_entry_t* sys_config, int sys_count, config_entry_t* current_state) {
    // In a real scenario, this would read /proc/sys, registry, etc.
    // For deterministic Ch execution, we map known config keys to state.
    strcpy(current_state[0].key, "firewall_enabled");
    strcpy(current_state[0].value, "1");
    
    strcpy(current_state[1].key, "max_connections");
    strcpy(current_state[1].value, "1000");
    
    strcpy(current_state[2].key, "ssh_root_login");
    strcpy(current_state[2].value, "0");
}

/**
 * Core drift detection and enforcement loop.
 */
void run_enforcement_cycle(policy_rule_t* rules, int rule_count, compliance_metric_t* metrics, int* metric_count) {
    config_entry_t* current_state = (config_entry_t*)calloc(rule_count, sizeof(config_entry_t));
    fetch_system_state(NULL, 0, current_state);
    
    for (int i = 0; i < rule_count && i < 100; i++) {
        compliance_metric_t* m = &metrics[(*metric_count)++];
        strcpy(m->metric, rules[i].name);
        
        // Parse current value from state
        int curr_val = 0;
        for (int j = 0; j < rule_count; j++) {
            if (strcmp(current_state[j].key, rules[i].name) == 0) {
                curr_val = atoi(current_state[j].value);
                break;
            }
        }
        
        m->current_value = curr_val;
        m->required_value = rules[i].value;
        evaluate_metric(m);
        
        if (!m->is_compliant) {
            char exp[16], act[16];
            sprintf(exp, "%d", rules[i].value);
            sprintf(act, "%d", curr_val);
            log_violation(m->metric, exp, act);
        }
    }
    
    free(current_state);
}
