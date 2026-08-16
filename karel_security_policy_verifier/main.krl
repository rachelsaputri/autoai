# Karel Security Policy Verifier - Main Application

This module serves as the entry point for the security policy verifier.
It initializes the parser, validator, and reporter components,
then executes the verification pipeline.

import policy_parser
import state_validator
import reporter

module main {

    // Main execution function
    function main() {
        var policy_file = "security_policies.pol"
        var state_file = "current_state.dat"
        var report_file = "compliance_report.txt"
        var exit_code = 0

        log_message("Starting Karel Security Policy Verifier...")

        // Step 1: Parse Policies
        var policy_list = policy_parser.parse_policies(policy_file)
        if policy_list == null {
            log_error("Failed to parse policies. Check policy file format.")
            return 1
        }
        log_message("Successfully loaded " + policy_list.length + " policies.")

        // Step 2: Validate State
        var state = state_validator.load_state(state_file)
        if state == null {
            log_error("Failed to load system state.")
            return 1
        }
        var violations = state_validator.check_compliance(state, policy_list)

        // Step 3: Generate Report
        if violations.length > 0 {
            report_file.write_report("Non-Compliant", violations)
            exit_code = 2
            log_message("Compliance check completed with " + violations.length + " violations.")
        } else {
            report_file.write_report("Compliant", [])
            log_message("Compliance check completed. System is fully compliant.")
        }

        return exit_code
    }

    // Logging helper
    function log_message(msg) {
        print("[INFO] " + msg)
    }

    // Error logging helper
    function log_error(msg) {
        print("[ERROR] " + msg)
    }
}
