include "types.fp"

-- Data Ingestor Module
-- Handles reading from various file formats

function ingest_csv(filepath) -> List[Record]:
    if not file_exists(filepath) then
        raise Error("File not found: " + filepath)
    endif
    
    let
        file_content = read_file_to_string(filepath)
        lines = split(file_content, "\n")
        headers = split(lines[0], ",")
        data_lines = tail(lines)
    in
        map(
            (line, index) -> 
                let
                    values = split(line, ",")
                    record = zip_with(
                        (key, val) -> (key, parse_value(val)),
                        headers,
                        values
                    )
                in
                    Map(record)
                end,
            data_lines,
            iterate(0)
        )
    end

function ingest_json(filepath) -> Record:
    if not file_exists(filepath) then
        raise Error("File not found: " + filepath)
    endif
    
    let
        content = read_file_to_string(filepath)
        parsed = parse_json(content)
    in
        parsed
    end

function parse_value(str) -> Value:
    -- Attempt to parse as integer
    if is_integer(str) then
        return Int(int(str))
    endif
    
    -- Attempt to parse as float
    if is_float(str) then
        return Float(num(str))
    endif
    
    -- Attempt to parse as boolean
    if str == "true" then
        return Bool(true)
    endif
    if str == "false" then
        return Bool(false)
    endif
    
    -- Default to string
    if str == "" then
        return Null
    endif
    
    return String(str)
end
