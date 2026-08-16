// dataProcessor.gml
// A comprehensive data processing utility for GM.

// Initialize data structures
var global_data = ds_map_create();
var global_arrays = ds_list_create();

// Function to load data from a string (CSV format for this example)
function process_csv_string(csv_string) {
    var lines = string_count_char(csv_string, "\n");
    var result = ds_list_create();
    
    var i = 0;
    while (i < lines) {
        var line = string_copy(csv_string, i, string_length(csv_string));
        var row = ds_map_create();
        
        var cols = string_count_char(line, ",");
        var k = 0;
        while (k <= cols) {
            var val = string_copy(line, k, string_length(line));
            var key = "col_" + string(k);
            ds_map_add(row, key, val);
            k += 1;
        }
        ds_list_add(result, row);
        i += 1;
    }
    
    return result;
}

// Function to process and filter data
function filter_data(data_list, filter_column, filter_value) {
    var filtered = ds_list_create();
    var size = ds_list_size(data_list);
    
    var i = 0;
    while (i < size) {
        var row = ds_list_find_value(data_list, i);
        var val = ds_map_find_value(row, filter_column);
        
        if (val == filter_value) {
            ds_list_add(filtered, row);
        }
        i += 1;
    }
    
    return filtered;
}

// Cleanup function
function cleanup_data_structures() {
    ds_map_destroy(global_data);
    ds_list_destroy(global_arrays);
