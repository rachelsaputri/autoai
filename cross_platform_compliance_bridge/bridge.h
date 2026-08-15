/*
 * Bridge Header Definitions
 * 
 * Includes definitions for policy structures, 
 * rule validation constants, and memory management macros.
 */

#ifndef BRIDGE_H
#define BRIDGE_H

#include <stddef.h>

/* Constants */
#define POLICY_VERSION "1.0.0"
#define MAX_CONFIG_DEPTH 10
#define BRIDGE_MODE_STRICT 1
#define BRIDGE_MODE_RELAXED 2

/* Macro for safe string copy */
#define SAFE_STRCPY(dest, src, size) \
    do { \
        strncpy(dest, src, size - 1); \
        dest[size - 1] = '\0'; \
    } while (0)

/* Function signatures */
void scan_workspace();
int check_compliance(void* module);
void remediate_gaps(void* module);
void generate_compliance_report();

#endif /* BRIDGE_H */
