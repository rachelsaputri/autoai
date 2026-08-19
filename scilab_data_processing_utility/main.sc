// Main Entry Point for Scilab Data Processing Utility

// Import functions
ilib_verbose(0); // Suppress library loading messages if packaged

// Configuration
input_file = ""; // Empty string triggers sample data generation
mode = "normalize"; // Transformation mode
output_report = "data_report.txt";

// 1. Ingest Data
disp("Ingesting data...");
[data, meta] = ingest_data(input_file);
disp("Data ingested: " + string(size(data, 1)) + "x" + string(size(data, 2)));

// 2. Validate Data
disp("Validating data...");
[valid_data, errors] = validate_data(data);
if ~isempty(errors)
    disp("Validation Errors:");
    for i = 1:size(errors, 'r')
        disp("- " + errors(i));
    end
else
    disp("Data is valid.");
end

// 3. Transform Data
disp("Transforming data...");
transformed_data = transform_data(valid_data, mode);

// 4. Generate Report
disp("Generating report...");
generate_report(transformed_data, output_report);

disp("Data processing complete.");
