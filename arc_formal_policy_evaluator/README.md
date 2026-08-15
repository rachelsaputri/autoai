# Arc Formal Compliance Policy Evaluator

An enterprise-grade Formal Compliance Policy Evaluator built in Arc. This tool is designed for automated parsing, evaluation, and proof-trace generation of complex compliance policies against system state definitions. It is ideal for integration into security audit pipelines, compliance dashboards, and formal verification workflows.

## Features
- **Policy Parsing:** Parses policies defined in a structured, human-readable Arc-compatible format.
- **State Evaluation:** Evaluates policies against provided system state definitions.
- **Proof Traces:** Generates detailed proof traces explaining policy satisfaction or failure.
- **Structured Output:** Exports evaluation results in JSON format for easy integration.
- **Modular Architecture:** Designed with modularity in mind, allowing for easy extension and customization.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/arc_formal_policy_evaluator.git
   cd arc_formal_policy_evaluator
   ```
2. Ensure you have an Arc interpreter installed. You can download it from the [official Arc website](https://github.com/madism/arc).

## Usage
1. **Define a Policy:** Create a policy file (e.g., `policy.arc`) with the desired compliance rules.
2. **Define a System State:** Create a state definition file (e.g., `state.arc`) representing the current system configuration.
3. **Run the Evaluator:** Execute the evaluator script with the policy and state files as arguments.
   ```bash
   arc evaluator.arc policy.arc state.arc
   ```
4. **View Results:** The evaluator will output a JSON file (`evaluation_results.json`) containing the evaluation results and proof traces.

## Policy Format
Policies are defined using a simple, Lisp-like syntax. Here is an example policy:

```lisp
(defpolicy example-policy
  (and
    (rule "password-must-be-complex"
      (>= (length password) 8)
      (contains password "!@#$%"))
    (rule "user-role-restricted"
      (member role '(admin user guest)))))
```

## State Definition Format
System states are defined similarly to policies, but they represent the current configuration of the system. Here is an example state:

```lisp
(defstate system-state
  (password "SecureP@ss123")
  (role "admin"))
```

## Evaluation Results
The evaluator outputs a JSON file with the following structure:

```json
{
  "policy": "example-policy",
  "status": "passed",
  "proof_traces": [
    {
      "rule": "password-must-be-complex",
      "status": "satisfied",
      "details": [
        {
          "expression": "(>= (length password) 8)",
          "result": true,
          "value": 13
        },
        {
          "expression": "(contains password \"!@#$%\")",
          "result": true,
          "value": true
        }
      ]
    },
    {
      "rule": "user-role-restricted",
      "status": "satisfied",
      "details": [
        {
          "expression": "(member role '(admin user guest))",
          "result": true,
          "value": "admin"
        }
      ]
    }
  ]
}
```

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License.
