/// @function parser_parse_csv(csv_string)
/// @description Parses a CSV formatted string into a list of ds_maps.
/// @param {string} csv_string
function parser_parse_csv(csv_string) {
    var result_list = ds_list_create();
    var settings = global.dp_settings;
    var delimiter = settings[? "delimiter"];
    var has_header = settings[? "header_row"];
    var trim = settings[? "trim_whitespace"];
    
    // Normalize line endings
    csv_string = string_replace_all(csv_string, "\\r\\n", "\\n");
    csv_string = string_replace_all(csv_string, "\\r", "\\n");
    
    var lines = string_split(csv_string, "\\n");
    var num_lines = ds_list_size(lines);
    
    if (num_lines == 0) {
        return result_list;
    }
    
    var headers = [];
    var header_index = -1;
    
    if (has_header) {
        header_index = 0;
        var header_line = ds_list_find_value(lines, 0);
        headers = string_split(header_line, delimiter);
        
        if (trim) {
            for (var i = 0; i < ds_list_size(headers); i++) {
                headers[| i] = string_trim(headers[| i]);
            }
        }
    }
    
    var start_line = has_header ? 1 : 0;
    
    for (var i = start_line; i < num_lines; i++) {
        var line = ds_list_find_value(lines, i);
        if (string_length(line) == 0) continue;
        
        var fields = string_split(line, delimiter);
        var record = ds_map_create();
        
        for (var j = 0; j < ds_list_size(fields); j++) {
            var field_value = ds_list_find_value(fields, j);
            if (trim) {
                field_value = string_trim(field_value);
            }
            
            if (has_header && j < ds_list_size(headers)) {
                var key = headers[| j];
                ds_map_add(record, key, field_value);
            } else {
                ds_map_add(record, "col_" + string(j), field_value);
            }
        }
        
        ds_list_add(result_list, record);
    }
    
    return result_list;
}
