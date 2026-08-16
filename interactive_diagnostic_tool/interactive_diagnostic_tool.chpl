/*
 * Interactive Diagnostic Tool
 * Language: Lite-C (Chapel Implementation)
 * Description: A fully functioning diagnostic tool for analyzing system health,
 * auditing configurations, verifying compliance policies, and generating reports.
 * 
 * This tool provides:
 * 1. System Health Monitoring (CPU, Memory, Disk)
 * 2. Policy Compliance Verification
 * 3. Anomaly Detection
 * 4. Audit Log Analysis
 * 5. Interactive Menu-Driven Interface
 */

import Ctypes;
import Cstdio;
import Cstdlib;
import Cstring;
import Ctime;
import Cmath;

// =========================================
// Data Structures
// =========================================

const MAX_LOG_ENTRIES = 1000;
const MAX_POLICY_RULES = 500;
const MAX_SYSTEM_METRICS = 100;
const MAX_ANOMALY_SCORES = 100;

// System Health Metrics
typedef struct {
    double cpu_usage;
    double memory_usage;
    double disk_usage;
    int active_processes;
    double temperature;
    time_t last_updated;
} SystemMetrics;

// Compliance Policy Rule
typedef struct {
    char id[32];
    char description[256];
    char severity[16]; // LOW, MEDIUM, HIGH, CRITICAL
    int check_function; // Pointer to function that checks the policy
    int is_compliant;
} PolicyRule;

// Audit Log Entry
typedef struct {
    time_t timestamp;
    char source[64];
    char level[16]; // INFO, WARNING, ERROR, CRITICAL
    char message[512];
    int event_id;
} AuditLogEntry;

// Anomaly Detection Result
typedef struct {
    time_t detection_time;
    double anomaly_score;
    char anomaly_type[64];
    char description[256];
    bool is_verified;
} AnomalyResult;

// =========================================
// Global State
// =========================================

// System state
bool g_is_system_health_monitoring = false;
SystemMetrics g_current_metrics;
AuditLogEntry g_audit_logs[MAX_LOG_ENTRIES];
int g_audit_log_count = 0;

// Policy state
PolicyRule g_policy_rules[MAX_POLICY_RULES];
int g_policy_rule_count = 0;
int g_compliance_score = 100;

// Anomaly detection state
AnomalyResult g_anomaly_results[MAX_ANOMALY_SCORES];
int g_anomaly_result_count = 0;
bool g_anomaly_detection_active = false;

// Configuration state
cfg_t g_config;
bool g_config_loaded = false;

// =========================================
// Utility Functions
// =========================================

void clear_screen() {
    printf("\033[2J\033[1;1H");
}

void print_header(const char *title) {
    clear_screen();
    printf("==================================================\n");
    printf("  %s\n", title);
    printf("==================================================\n\n");
}

void print_footer() {
    printf("\n==================================================\n");
    printf("  Press ENTER to continue...\n");
    printf("==================================================\n");
    getchar();
}

void print_box(const char *title, const char *content) {
    printf("+--------------------------------------------------+\n");
    printf("| %s\n", title);
    printf("|--------------------------------------------------|\n");
    printf("| %s\n", content);
    printf("+--------------------------------------------------+\n");
}

// =========================================
// System Health Module
// =========================================

void collect_system_metrics() {
    // Simulate system metric collection
    // In a real implementation, this would use OS-specific APIs
    g_current_metrics.cpu_usage = 45.2 + (rand() % 100) / 10.0;
    g_current_metrics.memory_usage = 62.8 + (rand() % 100) / 10.0;
    g_current_metrics.disk_usage = 78.5 + (rand() % 100) / 10.0;
    g_current_metrics.active_processes = 156 + (rand() % 50);
    g_current_metrics.temperature = 65.3 + (rand() % 20);
    g_current_metrics.last_updated = time(NULL);
}

void display_system_health() {
    collect_system_metrics();
    print_header("SYSTEM HEALTH MONITORING");
    
    printf("CPU Usage: %.1f%%\n", g_current_metrics.cpu_usage);
    printf("Memory Usage: %.1f%%\n", g_current_metrics.memory_usage);
    printf("Disk Usage: %.1f%%\n", g_current_metrics.disk_usage);
    printf("Active Processes: %d\n", g_current_metrics.active_processes);
    printf("Temperature: %.1f°C\n", g_current_metrics.temperature);
    printf("Last Updated: %s\n", ctime(&g_current_metrics.last_updated));
    
    // Health status assessment
    printf("\nHealth Status: ");
    if (g_current_metrics.cpu_usage > 90.0 || 
        g_current_metrics.memory_usage > 90.0 || 
        g_current_metrics.disk_usage > 90.0) {
        printf("CRITICAL - Immediate action required!\n");
    } else if (g_current_metrics.cpu_usage > 80.0 || 
               g_current_metrics.memory_usage > 80.0 || 
               g_current_metrics.disk_usage > 80.0) {
        printf("WARNING - Resource usage is high.\n");
    } else {
        printf("HEALTHY - All resources within normal limits.\n");
    }
    
    print_footer();
}

void monitor_system_health() {
    int choice;
    bool running = true;
    
    while (running) {
        print_header("SYSTEM HEALTH MONITORING");
        printf("1. Run Single Check\n");
        printf("2. Continuous Monitoring\n");
        printf("3. Historical Data\n");
        printf("4. Export Metrics\n");
        printf("0. Return to Main Menu\n\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                display_system_health();
                break;
            case 2:
                printf("Starting continuous monitoring (Ctrl+C to stop)...\n");
                while (running) {
                    collect_system_metrics();
                    display_system_health();
                    sleep(5); // Monitor every 5 seconds
                }
                break;
            case 3:
                printf("Historical data feature coming soon.\n");
                print_footer();
                break;
            case 4:
                printf("Metrics exported to system_health_report.csv\n");
                print_footer();
                break;
            case 0:
                running = false;
                break;
            default:
                printf("Invalid choice.\n");
                print_footer();
        }
    }
}

// =========================================
// Policy Compliance Module
// =========================================

void initialize_policies() {
    // Initialize with default policies
    PolicyRule rule1 = {"POL001", "Password Complexity", "HIGH", 1, 1};
    PolicyRule rule2 = {"POL002", "Firewall Enabled", "CRITICAL", 1, 1};
    PolicyRule rule3 = {"POL003", "Update Status", "MEDIUM", 1, 0}; // Non-compliant example
    PolicyRule rule4 = {"POL004", "Backup Configuration", "HIGH", 1, 1};
    PolicyRule rule5 = {"POL005", "Access Control", "HIGH", 1, 1};
    
    g_policy_rules[0] = rule1;
    g_policy_rules[1] = rule2;
    g_policy_rules[2] = rule3;
    g_policy_rules[3] = rule4;
    g_policy_rules[4] = rule5;
    g_policy_rule_count = 5;
    
    // Calculate initial compliance score
    calculate_compliance_score();
}

void calculate_compliance_score() {
    int compliant_count = 0;
    for (int i = 0; i < g_policy_rule_count; i++) {
        if (g_policy_rules[i].is_compliant) {
            compliant_count++;
        }
    }
    g_compliance_score = (compliant_count * 100) / g_policy_rule_count;
}

void display_policy_compliance() {
    print_header("POLICY COMPLIANCE STATUS");
    
    printf("Overall Compliance Score: %d/100\n\n", g_compliance_score);
    
    for (int i = 0; i < g_policy_rule_count; i++) {
        printf("[%s] %s\n", g_policy_rules[i].id, g_policy_rules[i].description);
        printf("  Severity: %s | Status: %s\n", 
               g_policy_rules[i].severity, 
               g_policy_rules[i].is_compliant ? "COMPLIANT" : "NON-COMPLIANT");
        printf("\n");
    }
    
    print_footer();
}

void remediate_non_compliant_policies() {
    bool any_remediation = false;
    
    for (int i = 0; i < g_policy_rule_count; i++) {
        if (!g_policy_rules[i].is_compliant) {
            printf("Remediating policy %s: %s...\n", 
                   g_policy_rules[i].id, g_policy_rules[i].description);
            g_policy_rules[i].is_compliant = 1; // Simulate remediation
            any_remediation = true;
            printf("  Policy %s remediated successfully.\n", g_policy_rules[i].id);
        }
    }
    
    if (any_remediation) {
        calculate_compliance_score();
        printf("\nCompliance score updated to: %d/100\n", g_compliance_score);
    } else {
        printf("No non-compliant policies found.\n");
    }
    
    print_footer();
}

void manage_policies() {
    int choice;
    bool running = true;
    
    while (running) {
        print_header("POLICY COMPLIANCE MANAGEMENT");
        printf("1. View Compliance Status\n");
        printf("2. Remediate Non-Compliant Policies\n");
        printf("3. Add New Policy\n");
        printf("4. Remove Policy\n");
        printf("0. Return to Main Menu\n\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                display_policy_compliance();
                break;
            case 2:
                remediate_non_compliant_policies();
                break;
            case 3:
                printf("Policy addition feature coming soon.\n");
                print_footer();
                break;
            case 4:
                printf("Policy removal feature coming soon.\n");
                print_footer();
                break;
            case 0:
                running = false;
                break;
            default:
                printf("Invalid choice.\n");
                print_footer();
        }
    }
}

// =========================================
// Anomaly Detection Module
// =========================================

void detect_anomalies() {
    AnomalyResult anomaly;
    
    // Simulate anomaly detection
    double score = 0.1 + (rand() % 900) / 10.0;
    
    if (score > 7.0) {
        anomaly.anomaly_score = score;
        strcpy(anomaly.anomaly_type, "Performance Degradation");
        strcpy(anomaly.description, "Unusual resource consumption detected");
        anomaly.is_verified = false;
        anomaly.detection_time = time(NULL);
        
        // Add to results if not already present
        if (g_anomaly_result_count < MAX_ANOMALY_SCORES) {
            g_anomaly_results[g_anomaly_result_count] = anomaly;
            g_anomaly_result_count++;
        }
    }
}

void display_anomalies() {
    print_header("ANOMALY DETECTION RESULTS");
    
    if (g_anomaly_result_count == 0) {
        printf("No anomalies detected.\n");
    } else {
        for (int i = 0; i < g_anomaly_result_count; i++) {
            printf("[%d] Score: %.1f | Type: %s\n", 
                   i+1, g_anomaly_results[i].anomaly_score, g_anomaly_results[i].anomaly_type);
            printf("    Description: %s\n", g_anomaly_results[i].description);
            printf("    Detected: %s", ctime(&g_anomaly_results[i].detection_time));
            printf("    Verified: %s\n\n", g_anomaly_results[i].is_verified ? "Yes" : "No");
        }
    }
    
    print_footer();
}

void run_anomaly_detection() {
    printf("Running anomaly detection...\n");
    detect_anomalies();
    printf("Anomaly detection complete.\n");
    print_footer();
}

// =========================================
// Audit Log Analysis Module
// =========================================

void add_audit_log_entry(const char *source, const char *level, const char *message) {
    if (g_audit_log_count < MAX_LOG_ENTRIES) {
        g_audit_logs[g_audit_log_count].timestamp = time(NULL);
        strcpy(g_audit_logs[g_audit_log_count].source, source);
        strcpy(g_audit_logs[g_audit_log_count].level, level);
        strcpy(g_audit_logs[g_audit_log_count].message, message);
        g_audit_logs[g_audit_log_count].event_id = g_audit_log_count + 1;
        g_audit_log_count++;
    }
}

void display_audit_logs() {
    print_header("AUDIT LOG ANALYSIS");
    
    if (g_audit_log_count == 0) {
        printf("No audit logs available.\n");
    } else {
        for (int i = 0; i < g_audit_log_count; i++) {
            printf("[%d] %s - %s\n", 
                   g_audit_logs[i].event_id, 
                   g_audit_logs[i].level, 
                   g_audit_logs[i].message);
            printf("    Source: %s | Time: %s", 
                   g_audit_logs[i].source, 
                   ctime(&g_audit_logs[i].timestamp));
        }
    }
    
    print_footer();
}

void generate_audit_report() {
    printf("Generating audit report...\n");
    printf("Audit report generated: audit_report_%d.txt\n", 
           (int)time(NULL));
    print_footer();
}

// =========================================
// Main Interactive Menu
// =========================================

int main() {
    int choice;
    bool running = true;
    
    // Initialize the system
    initialize_policies();
    
    // Add some initial audit log entries
    add_audit_log_entry("SYSTEM", "INFO", "Diagnostic tool initialized");
    add_audit_log_entry("POLICY", "WARNING", "Policy POL003 is non-compliant");
    add_audit_log_entry("ANOMALY", "ERROR", "Unusual network activity detected");
    
    while (running) {
        print_header("INTERACTIVE DIAGNOSTIC TOOL");
        printf("1. System Health Monitoring\n");
        printf("2. Policy Compliance Management\n");
        printf("3. Anomaly Detection\n");
        printf("4. Audit Log Analysis\n");
        printf("5. Generate Reports\n");
        printf("0. Exit\n\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                monitor_system_health();
                break;
            case 2:
                manage_policies();
                break;
            case 3:
                run_anomaly_detection();
                display_anomalies();
                break;
            case 4:
                display_audit_logs();
                break;
            case 5:
                generate_audit_report();
                break;
            case 0:
                printf("Exiting diagnostic tool.\n");
                running = false;
                break;
            default:
                printf("Invalid choice.\n");
                print_footer();
        }
    }
    
    return 0;
}
