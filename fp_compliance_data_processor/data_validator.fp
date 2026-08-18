include "types.fp"

-- Data Validator Module
-- Validates records against defined rules

function validate_records(records, rules) -> List[Record]:
    let
        filtered = filter(
            (record, index) -> check_record(record, index, rules),
            records,
            iterate(0)
        )
    in
        filtered
    end

function check_record(record, index, rules) -> Boolean:
    let
        errors = map(
            (rule) -> validate_field(record, rule, index),
            rules
        )
    in
        not any(
            (err) -> err != null,
            errors
        )
    end

function validate_field(record, rule, index) -> ProcessingError | Null:
    let
        key = rule.field
        val = Map.get(record, key)
        is_required = rule.required
        expected_type = rule.type
    in
        case val of
            | Null =>
                if is_required then
                    empty_error(index, key, "Required field missing")
                else
                    null
                endif
            | _ =>
                if not type_matches(val, expected_type) then
                    empty_error(index, key, "Type mismatch: expected " + expected_type)
                else
                    null
                endif
        end
    end

function type_matches(value, expected_type) -> Boolean:
    case value of
        | Int(_) => expected_type == "integer"
        | Float(_) => expected_type == "float" || expected_type == "number"
        | String(_) => expected_type == "string"
        | Bool(_) => expected_type == "boolean"
        | DateTime(_) => expected_type == "datetime"
        | Null => false
    end
end
