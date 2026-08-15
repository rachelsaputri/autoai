/* reporter.b - Report Generation */

#include "stdio.h"
#include "string.h"
#include "config.b"
#include "auditor.b"

/* Function to generate the audit report */
void generate_report(struct audit_config *config, int compliance_status) {
    FILE *fp;
    int i;

    /* Open the report file */
    fp = fopen(config->report_path, "w");
    if (fp == 0) {
        printf("Error: Could not open report file %s\n", config->report_path);
        return;
    }

    /* Write report header */
    fprintf(fp, "Legacy System Security Audit Report\n");
    fprintf(fp, "====================================\n\n");
    fprintf(fp, "Compliance Status: %s\n", compliance_status == 0 ? "Non-Compliant" : (compliance_status == 1 ? "Marginal" : "Compliant"));
    fprintf(fp, "\n");
    fprintf(fp, "Findings:\n");
    fprintf(fp, "---------\n");

    /* Write audit results */
    for (i = 0; i < result_count; i++) {
        fprintf(fp, "File: %s\n", results[i].file_path);
        fprintf(fp, "Severity: %d\n", results[i].severity);
        fprintf(fp, "Message: %s\n", results[i].message);
        fprintf(fp, "\n");
    }

    /* Write summary */
    fprintf(fp, "Summary\n");
    fprintf(fp, "-------\n");
    fprintf(fp, "Total Findings: %d\n", result_count);

    fclose(fp);

    printf("Report generated: %s\n", config->report_path);
}
