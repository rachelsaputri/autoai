module ingestor;

include "config.dsl";

function load_data(config: Config) -> list<dict> {
    list<dict> data = [];
    // Simulate file reading
    var line = "";
    while (read_line(line)) {
        var record = parse_record(line);
        if (record != null) {
            data.push(record);
        }
    }
    return data;
}

function parse_record(line: string) -> dict {
    var parts = split(line, ',');
    if (parts.size < 3) {
        return null;
    }
    dict record;
    record["id"] = parts[0];
    record["value"] = parts[1];
    record["status"] = parts[2];
    return record;
}
