/* config.b - Configuration Parser */

#include "stdio.h"
#include "string.h"

/* Structure to hold configuration */
struct audit_config {
    char target_file[256];
    char report_path[256];
    int verbose;
};

/* Function to load configuration from a file */
void load_config(struct audit_config *config) {
    FILE *fp;
    char line[256];

    /* Default configuration */
    strcpy(config->target_file, "default_target.bin");
    strcpy(config->report_path, "audit_report.txt");
    config->verbose = 0;

    /* Open configuration file */
    fp = fopen("audit_config.cfg", "r");
    if (fp == 0) {
        printf("Warning: Could not open configuration file. Using defaults.\n");
        return;
    }

    /* Parse configuration file */
    while (fgets(line, sizeof(line), fp) != 0) {
        /* Remove newline character */
        char *newline = strchr(line, '\n');
        if (newline != 0) {
            *newline = '\0';
        }

        /* Check for key-value pairs */
        char *key = strtok(line, "=");
        char *value = strtok(0, "=");

        if (key != 0 && value != 0) {
            if (strcmp(key, "target_file") == 0) {
                strcpy(config->target_file, value);
            } else if (strcmp(key, "report_path") == 0) {
                strcpy(config->report_path, value);
            } else if (strcmp(key, "verbose") == 0) {
                config->verbose = atoi(value);
            }
        }
    }

    fclose(fp);
}
