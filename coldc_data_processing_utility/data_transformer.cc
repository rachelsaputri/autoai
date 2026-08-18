package data_transformer

import std.io
import std.fs
import data_ingestor

// Define transformation rules
type TransformationRule { field: String, operation: String, value: Any }
type TransformationConfig { rules: List[TransformationRule] }

// Function to apply transformations
fn apply_transformations(data: Any, config: TransformationConfig): Any {
    let transformed_data = {}
    for (rule in config.rules) {
        switch rule.operation {
            case "upper":
                transformed_data[rule.field] = std.string.to_upper(data[rule.field])
                break
            case "lower":
                transformed_data[rule.field] = std.string.to_lower(data[rule.field])
                break
            case "add":
                transformed_data[rule.field] = data[rule.field] + rule.value
                break
            case "remove":
                transformed_data[rule.field] = null
                break
            default:
                throw new InvalidTransformationError("Unsupported operation")
        }
    }
    return transformed_data
}

// Main transformation function
fn transform_data(file_path: String, config_file_path: String): Any {
    let data = data_ingestor.ingest_data(file_path)
    let config = std.json.parse(std.fs.read_file(config_file_path))
    let rules = config.as(TransformationConfig).rules
    return apply_transformations(data, { rules })
}
