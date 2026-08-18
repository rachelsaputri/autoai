/// @function transformer_transform_batch(data_list)
/// @description Applies transformation rules to a list of records.
/// @param {ds_list} data_list
function transformer_transform_batch(data_list) {
    var transformed_list = ds_list_create();
    
    for (var i = 0; i < ds_list_size(data_list); i++) {
        var record = ds_list_find_value(data_list, i);
        var new_record = ds_map_create();
        
        // Copy existing data
        var keys = ds_map_find_first(record);
        while (keys != undefined) {
            var val = ds_map_find_value(record, keys);
            ds_map_add(new_record, keys, val);
            keys = ds_map_find_next(record, keys);
        }
        
        // Apply specific transformations
        // Example: Normalize 'status' field if it exists
        if (ds_map_exists(new_record, "status")) {
            var status_val = new_record[? "status"];
            status_val = string_lower(status_val);
            status_val = string_replace(status_val, " ", "_");
            new_record[? "status"] = status_val;
        }
        
        // Example: Clean 'name' field
        if (ds_map_exists(new_record, "name")) {
            var name_val = new_record[? "name"];
            name_val = string_trim(name_val);
            // Remove non-alphanumeric except spaces and hyphens
            var clean_name = "";
            var len = string_length(name_val);
            for (var k = 1; k <= len; k++) {
                var char = string_char_at(name_val, k);
                if (string_is_number(char) || char == " " || char == "-") {
                    clean_name += char;
                } else if (char >= "a" && char <= "z" || char >= "A" && char <= "Z") {
                    clean_name += char;
                }
            }
            new_record[? "name"] = clean_name;
        }
        
        ds_list_add(transformed_list, new_record);
    }
    
    return transformed_list;
}
