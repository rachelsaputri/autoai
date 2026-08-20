namespace Types;

type LogLevel = {
    Debug,
    Info,
    Warning,
    Error
};

type Severity = {
    Low,
    Medium,
    High,
    Critical
};

type PolicyStatus = {
    Compliant,
    NonCompliant
};

type SystemState = {
    timestamp: DateTime,
    cpu_usage: Float,
    memory_usage: Float,
    network_connections: Int
};

type Predicate = {
    evaluate: (SystemState) -> Boolean
};

type RemediationAction = {
    execute: (SystemState) -> Boolean
};

type Violation = {
    rule_id: String,
    severity: Severity,
    timestamp: DateTime,
    message: String
};

type EvaluationResult = {
    status: PolicyStatus,
    violations: List[Violation]
};

// Standard library wrappers for Godiva's built-in types
fun now() -> DateTime {
    // Returns current system time
    DateTime.now()
}
