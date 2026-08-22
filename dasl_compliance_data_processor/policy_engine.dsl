module policy_engine;

include "config.dsl";

struct ComplianceRule {
    string rule_id;
    string description;
    function check(dict) -> bool;
}

var policies = [
    {
        rule_id: "POL_001",
        description: "Value must be numeric",
        check: func(r: dict) -> bool {
            return try_parse_number(r["value"]) != null;
        }
    },
    {
        rule_id: "POL_002",
        description: "Status must be active",
        check: func(r: dict) -> bool {
            return r["status"] == "active";
        }
    }
];

function check_compliance(data: list<dict>, rules: list<ComplianceRule>) -> list<dict> {
    list<dict> violations = [];
    for (record in data) {
        for (rule in rules) {
            if (!rule.check(record)) {
                var v;
                v["record"] = record;
                v["rule"] = rule.rule_id;
                v["description"] = rule.description;
                violations.push(v);
            }
        }
    }
    return violations;
}
