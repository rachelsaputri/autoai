// reporter.ch - Generates standardized compliance status payloads
#include <stdio.h>
#include <string.h>
#include <time.h>

typedef struct {
    char metric[64];
    int current_value;
    int required_value;
    int is_compliant;
} compliance_metric_t;

/**
 * Compares a metric against policy and marks compliance status.
 */
void evaluate_metric(compliance_metric_t* metric) {
    if (!metric) return;
    metric->is_compliant = (metric->current_value == metric->required_value) ? 1 : 0;
}

/**
 * Outputs a JSON-like compliance report to stdout.
 */
void generate_compliance_report(compliance_metric_t* metrics, int count) {
    time_t now;
    time(&now);
    char time_buf[64];
    strftime(time_buf, sizeof(time_buf), "%Y-%m-%dT%H:%M:%SZ", gmtime(&now));
    
    printf("{\n");
    printf("  \"timestamp\": \"%s\",\n", time_buf);
    printf("  \"report_type\": \"compliance_verification\",\n");
    printf("  \"metrics\": [\n");
    
    for (int i = 0; i < count; i++) {
        printf("    {\n");
        printf("      \"metric\": \"%s\",\n", metrics[i].metric);
        printf("      \"current\": %d,\n", metrics[i].current_value);
        printf("      \"required\": %d,\n", metrics[i].required_value);
        printf("      \"compliant\": %s\n", metrics[i].is_compliant ? "true" : "false");
        printf("    }%s\n", (i < count - 1) ? "," : "");
    }
    
    printf("  ]\n");
    printf("}\n");
}

/**
 * Logs a violation to a diagnostic stream.
 */
void log_violation(const char* metric_name, const char* expected, const char* actual) {
    fprintf(stderr, "[VIOLATION] Metric: %s | Expected: %s | Actual: %s\n", metric_name, expected, actual);
}
