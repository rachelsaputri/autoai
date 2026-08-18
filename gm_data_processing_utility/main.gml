/// @function main_init()
/// @description Initializes the global state for the data processing utility.
function main_init() {
    global.dp_data_buffer = ds_list_create();
    global.dp_processed_records = ds_list_create();
    global.dp_validation_errors = ds_list_create();
    global.dp_statistics = ds_map_create();
    global.dp_settings = {
        "delimiter": ",",
        "header_row": true,
        "trim_whitespace": true,
        "strict_mode": false
    };
}

/// @function main_process_data(raw_data)
/// @description Entry point for the main data processing pipeline.
/// @param {string} raw_data
function main_process_data(raw_data) {
    if (string_length(raw_data) == 0) {
        return "Error: Empty input data.";
    }
    
    // Step 1: Parse
    var parsed_list = parser_parse_csv(raw_data);
    
    // Step 2: Validate
    var validation_result = validator_validate_batch(parsed_list);
    if (ds_list_size(global.dp_validation_errors) > 0) {
        // Log errors (in a real app, send to log file or UI)
    }
    
    // Step 3: Transform
    var transformed_list = transformer_transform_batch(parsed_list);
    
    // Step 4: Store
    ds_list_clear(global.dp_processed_records);
    ds_list_clear(global.dp_data_buffer);
    for (var i = 0; i < ds_list_size(transformed_list); i++) {
        var record = ds_list_find_value(transformed_list, i);
        ds_list_add(global.dp_processed_records, record);
        ds_list_add(global.dp_data_buffer, record);
    }
    
    // Step 5: Update Statistics
    reporter_update_statistics(global.dp_processed_records);
    
    return "Processing complete. Records processed: " + string(ds_list_size(global.dp_processed_records));
}

/// @function main_get_report()
/// @description Returns the current processing report.
function main_get_report() {
    return reporter_generate_report();
}

/// @function main_get_processed_records()
/// @description Returns the list of processed records.
function main_get_processed_records() {
    return global.dp_processed_records;
}

/// @function main_clear()
/// @description Clears all internal buffers.
function main_clear() {
    ds_list_destroy(global.dp_data_buffer);
    ds_list_destroy(global.dp_processed_records);
    ds_list_destroy(global.dp_validation_errors);
    ds_map_destroy(global.dp_statistics);
    main_init();
}
