module main;

include "config.dsl";
include "ingestor.dsl";
include "validator.dsl";
include "policy_engine.dsl";
include "reporter.dsl";

function main() {
    var config = init_config();
    var data = load_data(config);
    var issues = validate_data(data, config);
    var violations = check_compliance(data, policies);
    generate_report(violations, config.output_path + "compliance_report.txt");
    print("Processing complete. Found " + violations.size + " violations.");
}

main();
