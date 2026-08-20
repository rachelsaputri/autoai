import "types.god";

namespace Reporter;

type Reporter = {
    log_level: LogLevel,
    report_buffer: List[String]
};

fun initialize(log_level: LogLevel) -> Reporter {
    Reporter{
        log_level: log_level,
        report_buffer: List.new()
    }
}

fun generate(reporter: Reporter, result: EvaluationResult) -> String {
    let mut buffer = StringBuilder.new();
    buffer.append("\n=== Compliance Report ===\n");
    buffer.append("Timestamp: {}\n".format(result.violations.head.timestamp));
    buffer.append("Status: {}\n\n".format(result.status));
    
    if result.status == PolicyStatus.NonCompliant {
        buffer.append("Violations:\n");
        for violation in result.violations {
            buffer.append(" - {}: [{}] {}\n".format(
                violation.rule_id,
                violation.severity,
                violation.message
            ));
        }
    } else {
        buffer.append("No violations found. System is compliant.\n");
    }
    
    buffer.append("========================\n");
    report_buffer.add(buffer.to_string());
    buffer.to_string()
}

fun log(reporter: Reporter, report: String) {
    if reporter.log_level == LogLevel.Debug {
        print(report);
    } else if reporter.log_level == LogLevel.Info {
        println("[INFO] {}".format(report));
    }
}
