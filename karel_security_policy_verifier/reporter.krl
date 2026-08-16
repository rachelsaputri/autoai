# Reporter Module

This module generates compliance reports based on the verification results.
It supports both text and structured output formats.

module reporter {

    function write_report(status, violations) {
        var report_lines = []
        var timestamp = get_current_timestamp()

        report_lines.add("=" * 50)
        report_lines.add("KAREL SECURITY POLICY VERIFICATION REPORT")
        report_lines.add("=" * 50)
        report_lines.add("Timestamp: " + timestamp)
        report_lines.add("Status: " + status)
        report_lines.add("")

        if status == "Non-Compliant" {
            report_lines.add("VIOLATIONS FOUND: " + violations.length)
            report_lines.add("-" * 50)

            for each violation in violations {
                report_lines.add("Policy ID: " + violation.policy_id)
                report_lines.add("Policy Type: " + violation.policy_type)
                report_lines.add("Violation: " + violation.violation)
                report_lines.add("Current Value: " + violation.current_value)
                report_lines.add("")
            }
        } else {
            report_lines.add("No violations found. System is compliant.")
        }

        report_lines.add("=" * 50)

        var report_content = report_lines.join("\n")
        var output_file = "compliance_report.txt"
        var file_handle = file.open(output_file, "write")
        if file_handle != null {
            file_handle.write(report_content)
            file_handle.close()
        }

        return report_content
    }

    function get_current_timestamp() {
        var now = new datetime()
        return now.format("YYYY-MM-DD HH:MM:SS")
    }
}
