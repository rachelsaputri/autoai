# Gosu Security Policy Auditor

A high-performance, JVM-based enterprise security policy compliance auditor built strictly using the **Gosu** programming language. This tool provides real-time policy verification, drift detection, and compliance reporting within enterprise Java/Kotlin ecosystems.

## Features
- **Strict Gosu Implementation**: 100% written in Gosu, leveraging the JVM for performance and interop.
- **Policy Parsing & Validation**: Robust parsing of JSON-based security policies with strict schema validation.
- **Compliance Scoring Engine**: Deterministic scoring algorithm for multi-factor compliance assessment.
- **Drift Detection**: Automated comparison of current system state against baseline policies.
- **JVM Ecosystem Integration**: Seamless integration with Java/Kotlin enterprise tools, logging frameworks, and build systems (Gradle/Maven).

## File Structure
```
gosu_security_policy_auditor/
├── README.md
├── build.gradle
└── src/
    └── main/
        └── gosuproject/
            ├── AuditConfig.gosu
            ├── PolicyEngine.gosu
            ├── ComplianceScore.gosu
            ├── DriftDetector.gosu
            ├── Logger.gosu
            └── Main.gosu
```

## Build & Run
Requires `gradle` and the **Gosu Gradle Plugin**.

```bash
gradle build
java -jar build/libs/gosu_security_policy_auditor.jar
```

## License
MIT License
