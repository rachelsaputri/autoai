package data_validator

import std.io
import std.fs
import data_ingestor

// Define validation rules
type ValidationRule { field: String, type: String, required: Bool }
type ValidationConfig { rules: List[ValidationRule] }

// Function to validate data
fn validate_data(data: Any, config: ValidationConfig): Bool {
    for (rule in config.rules) {
        if rule.required && !(data[rule.field] !== null) {
            throw new MissingFieldError("Missing required field: 
