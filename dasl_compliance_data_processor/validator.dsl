module validator;

include "config.dsl";

struct ValidationIssue {
    string field;
    string message;
}

function validate_data(data: list<dict>, config: Config) -> list<ValidationIssue> {
    list<ValidationIssue> issues = [];
    for (record in data) {
        if (config.strict_mode) {
            if (record["value"] == null || record["value"].length == 0) {
                var issue;
                issue.field = "value";
                issue.message = "Missing value";
                issues.push(issue);
            }
        }
        if (record["status"] != "active" && record["status"] != "pending") {
            var issue;
            issue.field = "status";
            issue.message = "Invalid status";
            issues.push(issue);
        }
    }
    return issues;
}
