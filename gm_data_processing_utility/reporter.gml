/// @function reporter_update_statistics(records_list)
/// @description Updates the global statistics map based on processed records.
/// @param {ds_list} records_list
function reporter_update_statistics(records_list) {
    ds_map_clear(global.dp_statistics);
    
    var total_records = ds_list_size(records_list);
    var valid_count = 0;
    var invalid_count = 0;
    var status_counts = ds_map_create();
    var age_sum = 0;
    var age_count = 0;
    
    for (var i = 0; i < total_records; i++) {
        var record = ds_list_find_value(records_list, i);
        
        // Count by status
        if (ds_map_exists(record, "status")) {
            var status = record[? "status"];
            if (ds_map_exists(status_counts, status)) {
                status_counts[? status] += 1;
            } else {
                ds_map_add(status_counts, status, 1);
            }
        }
        
        // Calculate average age
        if (ds_map_exists(record, "age")) {
            var age = real(record[? "age"]);
            age_sum += age;
            age_count += 1;
        }
    }
    
    global.dp_statistics[? "total_records"] = total_records;
    global.dp_statistics[? "validation_errors"] = ds_list_size(global.dp_validation_errors);
    global.dp_statistics[? "status_distribution"] = status_counts;
    global.dp_statistics[? "avg_age"] = (age_count > 0) ? (age_sum / age_count) : 0;
    
    ds_list_destroy(status_counts);
}

/// @function reporter_generate_report()
/// @description Generates a string report of the current processing session.
function reporter_generate_report() {
    var report = "=== Data Processing Report ===\\n";
    report += "Total Records: " + string(global.dp_statistics[? "total_records"]) + "\\n";
    report += "Validation Errors: " + string(global.dp_statistics[? "validation_errors"]) + "\\n";
    report += "Average Age: " + string(real(global.dp_statistics[? "avg_age"])) + "\\n";
    report += "\\nStatus Distribution:\\n";
    
    var status_dist = global.dp_statistics[? "status_distribution"];
    var keys = ds_map_find_first(status_dist);
    while (keys != undefined) {
        report += "  - " + string(keys) + ": " + string(status_dist[? keys]) + "\\n";
        keys = ds_map_find_next(status_dist, keys);
    }
    
    report += "============================";
    return report;
}
