include "types.fp"

-- Data Exporter Module
-- Handles writing processed data to output files

function export_json(filepath, records) -> Void:
    let
        json_string = serialize_to_json(records)
        file_content = build_json_output(json_string)
    in
        write_string_to_file(filepath, file_content)
    end

function serialize_to_json(records) -> String:
    -- Convert list of records to JSON string
    -- This is a simplified representation
    let
        records_json = map(
            (record) -> record_to_json_string(record),
            records
        )
        joined = join_with(",\n", records_json)
    in
        "[\n" + joined + "\n]"
    end

function record_to_json_string(record) -> String:
    let
        pairs = map(
            (key, val) ->
                "    \"" + key + "\": " + value_to_json_string(val),
            record
        )
        joined = join_with(",\n", pairs)
    in
        "{\n" + joined + "\n  }"
    end

function value_to_json_string(value) -> String:
    case value of
        | Null => "null"
        | Bool(b) => if b then "true" else "false" endif
        | Int(n) => str(n)
        | Float(f) => str(f)
        | String(s) => "\"" + s + "\""
        | DateTime(d) => "\"" + format_datetime(d) + "\""
    end
end

function build_json_output(json_content) -> String:
    "{" + "\n" +
    "  \"metadata\": {\n" +
    "    \"timestamp\": \"" + str(get_current_timestamp()) + "\",\n" +
    "    \"format\": \"compliance_v1\"\n" +
    "  },\n" +
    "  \"data\": " + json_content + "\n" +
    "}"
end

function write_string_to_file(filepath, content) -> Void:
    -- Implementation details depend on the host environment
    -- Here we assume a standard file write operation
    file = open(filepath, "write")
    write(file, content)
    close(file)
end
