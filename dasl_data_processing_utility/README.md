module dasl_data_processing_utility

import dasl_stdlib.io
import dasl_stdlib.collections
import dasl_stdlib.math

/*
 * DASL Data Processing Utility Module
 * 
 * This module provides core data processing utilities for DASL applications.
 * It includes functions for data validation, transformation, cleaning,
 * and statistical analysis.
 * 
 * Author: Autonomous AI Polyglot Software Engineer
 * Created: 2024
 */

// Constants for data types
const STRING_TYPE = "string"
const INTEGER_TYPE = "integer"
const FLOAT_TYPE = "float"
const BOOLEAN_TYPE = "boolean"
const DATE_TYPE = "date"
const OBJECT_TYPE = "object"

// Constants for processing modes
const MODE_STRICT = "strict"
const MODE_LOOSE = "loose"
const MODE_SILENT = "silent"

// Error codes
const ERROR_INVALID_DATA = 1001
const ERROR_TYPE_MISMATCH = 1002
const ERROR_MISSING_VALUE = 1003
const ERROR_CORRUPTED_FORMAT = 1004
const ERROR_OUT_OF_RANGE = 1005

// Data record structure
type DataRecord {
    id: integer
    name: string
    values: array<float>
    metadata: object
    status: string
}

// Processing result structure
type ProcessingResult {
    processed_count: integer
    error_count: integer
    warnings_count: integer
    output_data: array<DataRecord>
    errors: array<string>
    warnings: array<string>
}

// Configuration structure
type ProcessingConfig {
    mode: string
    strict_validation: boolean
    auto_clean: boolean
    max_records: integer
    output_format: string
}

// Initialize configuration
declare default_config: ProcessingConfig = {
    mode: MODE_STRICT,
    strict_validation: true,
    auto_clean: true,
    max_records: 10000,
    output_format: "standard"
}

/*
 * Validates if a value matches the expected type
 * 
 * @param value: The value to validate
 * @param expected_type: The expected data type
 * @return: boolean indicating if type matches
 */
function validate_type(value, expected_type) -> boolean {
    let result = false
    
    if expected_type == STRING_TYPE {
        result = type_of(value) == "string"
    } else if expected_type == INTEGER_TYPE {
        result = type_of(value) == "integer"
    } else if expected_type == FLOAT_TYPE {
        result = type_of(value) == "float" or type_of(value) == "integer"
    } else if expected_type == BOOLEAN_TYPE {
        result = type_of(value) == "boolean"
    } else if expected_type == DATE_TYPE {
        result = type_of(value) == "date" or (type_of(value) == "string" and is_date_format(value))
    }
    
    return result
}

/*
 * Checks if a string follows a standard date format
 * 
 * @param date_str: The date string to check
 * @return: boolean indicating if it's a valid date format
 */
function is_date_format(date_str) -> boolean {
    // Simple date format validation (YYYY-MM-DD)
    let regex_pattern = "^\\d{4}-\\d{2}-\\d{2}$"
    let match_result = match_regex(date_str, regex_pattern)
    
    if match_result.success {
        let parts = split(date_str, "-")
        let year = parse_integer(parts[0])
        let month = parse_integer(parts[1])
        let day = parse_integer(parts[2])
        
        // Basic range validation
        if year >= 1900 and year <= 2100 
           and month >= 1 and month <= 12
           and day >= 1 and day <= 31 {
            return true
        }
    }
    
    return false
}

/*
 * Cleans and normalizes string data
 * 
 * @param input: The input string to clean
 * @return: Cleaned and normalized string
 */
function clean_string_data(input) -> string {
    if input == null or input == "" {
        return ""
    }
    
    let cleaned = input
    // Remove extra whitespace
    cleaned = trim(cleaned)
    // Normalize multiple spaces to single space
    cleaned = replace_all(cleaned, "\\s+", " ")
    // Trim again after replacement
    cleaned = trim(cleaned)
    
    return cleaned
}

/*
 * Validates a data record against schema requirements
 * 
 * @param record: The data record to validate
 * @param config: Processing configuration
 * @return: Array of error messages (empty if valid)
 */
function validate_record(record, config) -> array<string> {
    let errors = create_array<string>()
    
    if config.strict_validation {
        // Validate required fields
        if record.id == null or record.id < 0 {
            add_to_array(errors, "Invalid or missing record ID")
        }
        
        if record.name == null or clean_string_data(record.name) == "" {
            add_to_array(errors, "Invalid or missing record name")
        } else {
            record.name = clean_string_data(record.name)
        }
        
        if record.values == null {
            add_to_array(errors, "Missing values array")
        } else {
            // Validate values are numeric
            for each val in record.values {
                if not validate_type(val, FLOAT_TYPE) {
                    add_to_array(errors, "Non-numeric value found in values array")
                    break
                }
            }
        }
        
        if record.status == null or record.status == "" {
            add_to_array(errors, "Missing record status")
        }
    }
    
    return errors
}

/*
 * Transforms data records according to processing rules
 * 
 * @param records: Array of data records to transform
 * @param config: Processing configuration
 * @return: Transformed array of data records
 */
function transform_data(records, config) -> array<DataRecord> {
    let transformed = create_array<DataRecord>()
    
    if records == null or size_of(records) == 0 {
        return transformed
    }
    
    let count = 0
    for each record in records {
        if count >= config.max_records {
            break
        }
        
        // Perform transformations
        let transformed_record = create_instance<DataRecord>()
        
        transformed_record.id = record.id
        transformed_record.name = clean_string_data(record.name)
        
        // Transform values (normalize if needed)
        transformed_record.values = transform_values(record.values, config.mode)
        
        // Copy metadata
        if record.metadata != null {
            transformed_record.metadata = record.metadata
        } else {
            transformed_record.metadata = create_instance<object>()
        }
        
        // Set status
        transformed_record.status = "processed"
        
        add_to_array(transformed, transformed_record)
        count = count + 1
    }
    
    return transformed
}

/*
 * Transforms values array based on processing mode
 * 
 * @param values: Array of float values
 * @param mode: Processing mode (strict, loose, silent)
 * @return: Transformed array of float values
 */
function transform_values(values, mode) -> array<float> {
    let transformed = create_array<float>()
    
    if values == null {
        return transformed
    }
    
    for each val in values {
        if mode == MODE_STRICT {
            // Strict mode: only include valid numeric values
            if validate_type(val, FLOAT_TYPE) {
                add_to_array(transformed, val)
            }
        } else if mode == MODE_LOOSE {
            // Loose mode: convert valid values, skip invalid
            if validate_type(val, FLOAT_TYPE) {
                add_to_array(transformed, val)
            }
        } else if mode == MODE_SILENT {
            // Silent mode: attempt conversion, default to 0 if fails
            if validate_type(val, FLOAT_TYPE) {
                add_to_array(transformed, val)
            } else {
                add_to_array(transformed, 0.0)
            }
        }
    }
    
    return transformed
}

/*
 * Cleans data by removing outliers and invalid entries
 * 
 * @param records: Array of data records to clean
 * @param config: Processing configuration
 * @return: Cleaned array of data records
 */
function clean_data(records, config) -> array<DataRecord> {
    if not config.auto_clean {
        return records
    }
    
    let cleaned = create_array<DataRecord>()
    
    for each record in records {
        let is_valid = true
        let reasons = create_array<string>()
        
        // Check for invalid IDs
        if record.id < 0 {
            is_valid = false
            add_to_array(reasons, "Invalid ID")
        }
        
        // Check for empty names
        if record.name == null or clean_string_data(record.name) == "" {
            is_valid = false
            add_to_array(reasons, "Empty name")
        }
        
        // Check values for outliers (simple IQR method)
        if record.values != null and size_of(record.values) > 0 {
            let sorted_values = sort_array(record.values)
            let q1 = get_percentile(sorted_values, 25)
            let q3 = get_percentile(sorted_values, 75)
            let iqr = q3 - q1
            let lower_bound = q1 - 1.5 * iqr
            let upper_bound = q3 + 1.5 * iqr
            
            let has_outliers = false
            for each val in record.values {
                if val < lower_bound or val > upper_bound {
                    has_outliers = true
                    break
                }
            }
            
            if has_outliers {
                // Clean outliers by replacing with median
                let median = get_percentile(sorted_values, 50)
                for each val in record.values {
                    if val < lower_bound or val > upper_bound {
                        replace_in_array(record.values, val, median)
                    }
                }
                add_to_array(reasons, "Outliers cleaned")
            }
        }
        
        if is_valid {
            add_to_array(cleaned, record)
        }
    }
    
    return cleaned
}

/*
 * Calculates basic statistical measures on a dataset
 * 
 * @param records: Array of data records to analyze
 * @return: ProcessingResult with statistical summary
 */
function analyze_data(records) -> ProcessingResult {
    let result = create_instance<ProcessingResult>()
    result.processed_count = 0
    result.error_count = 0
    result.warnings_count = 0
    result.output_data = create_array<DataRecord>()
    result.errors = create_array<string>()
    result.warnings = create_array<string>()
    
    if records == null or size_of(records) == 0 {
        return result
    }
    
    let total_values = create_array<float>()
    
    for each record in records {
        result.processed_count = result.processed_count + 1
        
        // Validate record
        let validation_errors = validate_record(record, default_config)
        if size_of(validation_errors) > 0 {
            result.error_count = result.error_count + 1
            for each error in validation_errors {
                add_to_array(result.errors, "Record " + string_of(record.id) + ": " + error)
            }
            continue
        }
        
        // Add to output
        add_to_array(result.output_data, record)
        
        // Collect values for statistics
        if record.values != null {
            for each val in record.values {
                add_to_array(total_values, val)
            }
        }
    }
    
    // Calculate statistics if we have data
    if size_of(total_values) > 0 {
        let mean_val = calculate_mean(total_values)
        let median_val = get_percentile(total_values, 50)
        let min_val = get_min(total_values)
        let max_val = get_max(total_values)
        let std_dev = calculate_standard_deviation(total_values, mean_val)
        
        add_to_array(result.warnings, "Statistics: Mean=" + string_of(mean_val) 
            + ", Median=" + string_of(median_val) 
            + ", Min=" + string_of(min_val) 
            + ", Max=" + string_of(max_val) 
            + ", StdDev=" + string_of(std_dev))
    }
    
    return result
}

/*
 * Helper function to calculate mean of array
 * 
 * @param values: Array of floats
 * @return: Mean value as float
 */
function calculate_mean(values) -> float {
    if size_of(values) == 0 {
        return 0.0
    }
    
    let sum = 0.0
    for each val in values {
        sum = sum + val
    }
    
    return sum / size_of(values)
}

/*
 * Helper function to calculate standard deviation
 * 
 * @param values: Array of floats
 * @param mean: The mean value (pre-calculated)
 * @return: Standard deviation as float
 */
function calculate_standard_deviation(values, mean) -> float {
    if size_of(values) <= 1 {
        return 0.0
    }
    
    let sum_squared_diff = 0.0
    for each val in values {
        let diff = val - mean
        sum_squared_diff = sum_squared_diff + (diff * diff)
    }
    
    let variance = sum_squared_diff / size_of(values)
    return square_root(variance)
}

/*
 * Helper function to get minimum value from array
 * 
 * @param values: Array of floats
 * @return: Minimum value as float
 */
function get_min(values) -> float {
    if size_of(values) == 0 {
        return 0.0
    }
    
    let min_val = values[0]
    for each val in values {
        if val < min_val {
            min_val = val
        }
    }
    return min_val
}

/*
 * Helper function to get maximum value from array
 * 
 * @param values: Array of floats
 * @return: Maximum value as float
 */
function get_max(values) -> float {
    if size_of(values) == 0 {
        return 0.0
    }
    
    let max_val = values[0]
    for each val in values {
        if val > max_val {
            max_val = val
        }
    }
    return max_val
}

/*
 * Helper function to get percentile value
 * 
 * @param values: Array of floats (should be sorted)
 * @param percentile: Percentile to calculate (0-100)
 * @return: Percentile value as float
 */
function get_percentile(values, percentile) -> float {
    if size_of(values) == 0 {
        return 0.0
    }
    
    let sorted_values = sort_array(values)
    let index = (percentile / 100.0) * (size_of(sorted_values) - 1)
    let lower_index = floor(index)
    let upper_index = ceil(index)
    
    if lower_index == upper_index {
        return sorted_values[lower_index]
    }
    
    let lower_value = sorted_values[lower_index]
    let upper_value = sorted_values[upper_index]
    let fraction = index - lower_index
    
    return lower_value + fraction * (upper_value - lower_value)
}

/*
 * Main data processing pipeline function
 * 
 * @param input_data: Array of data records to process
 * @param config: Processing configuration (optional)
 * @return: ProcessingResult with final output
 */
function main_pipeline(input_data, config) -> ProcessingResult {
    // Use default config if none provided
    if config == null {
        config = default_config
    }
    
    let result = create_instance<ProcessingResult>()
    
    if input_data == null or size_of(input_data) == 0 {
        result.error_count = 1
        add_to_array(result.errors, "Input data is empty or null")
        return result
    }
    
    // Step 1: Validate records
    let valid_records = create_array<DataRecord>()
    for each record in input_data {
        let validation_errors = validate_record(record, config)
        if size_of(validation_errors) == 0 {
            add_to_array(valid_records, record)
        } else {
            result.error_count = result.error_count + 1
            for each error in validation_errors {
                add_to_array(result.errors, "Record " + string_of(record.id) + ": " + error)
            }
        }
    }
    
    // Step 2: Clean data
    let cleaned_records = clean_data(valid_records, config)
    
    // Step 3: Transform data
    let transformed_records = transform_data(cleaned_records, config)
    
    // Step 4: Analyze and generate statistics
    result = analyze_data(transformed_records)
    
    return result
}

/*
 * Export module symbols
 */
export validate_type
export clean_string_data
export validate_record
export transform_data
export transform_values
export clean_data
export analyze_data
export calculate_mean
export calculate_standard_deviation
export get_min
export get_max
export get_percentile
export main_pipeline
export ProcessingConfig
export DataRecord
export ProcessingResult

end_module
