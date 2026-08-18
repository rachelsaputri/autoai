/// @function validator_validate_batch(data_list)
/// @description Validates a list of records against basic rules.
/// @param {ds_list} data_list
function validator_validate_batch(data_list) {
    ds_list_clear(global.dp_validation_errors);
    
    for (var i = 0; i < ds_list_size(data_list); i++) {
        var record = ds_list_find_value(data_list, i);
        var errors = ds_list_create();
        var row_idx = i + 1;
        
        // Rule: 'id' field must exist and be numeric
        if (!ds_map_exists(record, "id")) {
            ds_list_add(errors, "Missing 'id' field");
        } else {
            if (!string_is_number(record[? "id"])) {
                ds_list_add(errors, "'id' is not numeric");
            }
        }
        
        // Rule: 'email' field must contain '@' if present
        if (ds_map_exists(record, "email")) {
            var email = record[? "email"];
            if (string_pos("@", email) == 0) {
                ds_list_add(errors, "Invalid 'email' format");
            }
        }
        
        // Rule: 'age' field must be between 18 and 120 if present
        if (ds_map_exists(record, "age")) {
            var age = real(record[? "age"]);
            if (age < 18 || age > 120) {
                ds_list_add(errors, "'age' out of range (18-120)");
            }
        }
        
        if (ds_list_size(errors) > 0) {
            var error_summary = "Row " + string(row_idx) + ": ";
            for (var j = 0; j < ds_list_size(errors); j++) {
                error_summary += ds_list_find_value(errors, j);
                if (j < ds_list_size(errors) - 1) error_summary += "; ";
            }
            ds_list_add(global.dp_validation_errors, error_summary);
        }
        
        ds_list_destroy(errors);
    }
}
