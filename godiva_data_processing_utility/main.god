import DataProcessor;
import Validator;
import Transformer;
import Reporter;

/**
 * Main entry point for the Godiva Data Processing Utility.
 * Orchestrates the ingestion, validation, transformation, and reporting phases.
 */

function main() {
    // Define the pipeline configuration
    var config = {
        "input_path": "./data/input.csv",
        "output_path": "./data/output.json",
        "log_level": "INFO",
        "strict_mode": true
    };

    // Initialize the data processor
    var processor = DataProcessor.init(config);
    
    if (processor.status != "ok") {
        Reporter.log_error("Failed to initialize processor: " + processor.message);
        return 1;
    }

    // Phase 1: Ingest Data
    Reporter.log_info("Starting ingestion phase...");
    var dataset = Processor.ingest(processor, config.input_path);
    
    if (dataset == null || dataset.count == 0) {
        Reporter.log_error("No data ingested or empty dataset.");
        return 2;
    }
    Reporter.log_info("Ingested " + dataset.count + " records.");

    // Phase 2: Validate Data
    Reporter.log_info("Starting validation phase...");
    var valid_dataset = Validator.validate(dataset);
    
    if (valid_dataset.errors.count > 0) {
        Reporter.log_warning(valid_dataset.errors.count + " validation errors found.");
        Reporter.save_errors(valid_dataset.errors, "./logs/validation_errors.log");
    }
    Reporter.log_info("Validation complete. " + valid_dataset.count + " valid records remain.");

    // Phase 3: Transform Data
    Reporter.log_info("Starting transformation phase...");
    var transformed_dataset = Transformer.transform(valid_dataset);
    Reporter.log_info("Transformation complete. Normalization applied.");

    // Phase 4: Report/Export
    Reporter.log_info("Starting export phase...");
    Processor.export(processor, transformed_dataset, config.output_path);
    Reporter.log_info("Data successfully exported to " + config.output_path);

    return 0;
}
