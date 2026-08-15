#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cilk/cilk.h>
#include <cilk/reducer.h>

// Global policy configuration
extern const char *POLICY_FILE;

/**
 * @brief Main entry point for the Cilk Parallel Compliance Scanner.
 * 
 * This function orchestrates the parallel execution of system integrity audits.
 * It initializes the environment, loads policies, and spawns parallel tasks
 * for different audit categories (file checks, hash validation, etc.).
 * 
 * @param argc Argument count.
 * @param argv Argument vector.
 * @return int Exit status.
 */
int main(int argc, char *argv[]) {
    // Output directory default
    char output_dir[256] = "./scanner_results";
    
    // Check for optional output directory argument
    if (argc > 1) {
        strncpy(output_dir, argv[1], sizeof(output_dir) - 1);
        output_dir[sizeof(output_dir) - 1] = '\0';
    }

    // Ensure output directory exists (simple implementation)
    // In a production environment, use mkdir -p equivalent
    printf("[INFO] Starting Compliance Scanner...\n");
    printf("[INFO] Output directory: %s\n", output_dir);

    // Define audit tasks
    void (*audit_tasks[])() = {
        audit_file_integrity,
        audit_system_hashes,
        audit_registry_keys // Example task
    };
    int num_tasks = sizeof(audit_tasks) / sizeof(audit_tasks[0]);

    // Execute audits in parallel using Cilk
    // Note: cilk_for is used for uniform task distribution
    cilk_for (int i = 0; i < num_tasks; i++) {
        audit_tasks[i]();
    }

    // Synchronize and wait for all spawned tasks to complete
    cilk_sync;

    // Generate final report
    printf("[INFO] Generating final compliance report...\n");
    generate_compliance_report(output_dir);

    printf("[INFO] Compliance Scanner completed successfully.\n");
    return 0;
}
