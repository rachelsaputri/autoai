include "types.fp"

-- Data Transformer Module
-- Applies pure functional transformations to records

function transform_records(records) -> List[Record]:
    map(
        normalize_record,
        records
    )
end

function normalize_record(record) -> Record:
    let
        -- Ensure ID is present and integer
        id_val = get_field(record, "id")
        safe_id = case id_val of
            | Null => generate_unique_id()
            | Int(n) => n
            | String(s) => if is_integer(s) then int(s) else generate_unique_id() endif
            | _ => generate_unique_id()
        end
        
        -- Trim strings
        trimmed_map = map_with_key(
            (key, val) ->
                case val of
                    | String(s) => (key, String(trim(s)))
                    | _ => (key, val)
                end,
            record
        )
    in
        put_field(trimmed_map, "id", Int(safe_id))
    end

function generate_unique_id() -> Integer:
    -- In a real system, use a UUID or timestamp-based ID generator
    -- Here we use a simple mock based on current time
    current_time = get_current_timestamp()
    return mod(current_time, 1000000000)
end

function get_field(record, key) -> Value:
    case Map.get(record, key) of
        | Some(val) => val
        | None => Null
    end
end

function put_field(record, key, value) -> Record:
    Map.set(record, key, value)
end
