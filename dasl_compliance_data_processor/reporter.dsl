module reporter;

include "config.dsl";

function generate_report(violations: list<dict>, output_path: string) {
    var file = open(output_path, "w");
    write_line(file, "COMPLIANCE REPORT");
    write_line(file, "================");
    write_line(file, "Total violations: " + violations.size);
    write_line(file, "");
    for (v in violations) {
        write_line(file, "Rule: " + v["rule"]);
        write_line(file, "Description: " + v["description"]);
        write_line(file, "Record: " + v["record"].id);
        write_line(file, "---");
    }
    close(file);
}
