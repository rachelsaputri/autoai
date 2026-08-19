/**
 * main.gp
 * Entry point for the PARI/GP Data Processing Utility.
 * Orchestrates parsing, validation, transformation, and reporting.
 */

\r "parser.gp"
\r "validator.gp"
\r "transformer.gp"
\r "reporter.gp"

/**
 * Main execution function.
 * Demonstrates the full pipeline.
 */
main() = {
    print("=== PARI/GP Data Processing Utility ===");
    
    // 1. Define raw data (simulating CSV content)
    local raw_csv_data = "id,value,score\n1,10,0.5\n2,20,0.8\n3,30,0.2\n4,40,0.9\n5,50,0.7";
    
    print("\n[1] Ingesting Data...");
    // Parse the CSV string into a structured format
    // parser_csv_to_matrix ignores header if flag is set, returns pure numeric matrix
    local parsed_matrix = parser_parse_csv(raw_csv_data, 1);
    
    if (ismatrix(parsed_matrix),
        print("  -> Successfully parsed into matrix:");
        print(parsed_matrix),
        error("Failed to parse data.")
    );
    
    // 2. Validate Data
    print("\n[2] Validating Data...");
    local validation_result = validator_validate_matrix(parsed_matrix);
    
    if (validation_result[1],
        print("  -> Validation Passed."),
        print("  -> Validation Failed: " * validation_result[2])
    );
    
    // 3. Transform Data
    print("\n[3] Transforming Data...");
    // Normalize the matrix (z-score normalization)
    local transformed_matrix = transformer_normalize(parsed_matrix);
    print("  -> Normalized Matrix:");
    print(transformed_matrix);
    
    // 4. Generate Report
    print("\n[4] Generating Report...");
    reporter_print_summary(parsed_matrix);
    
    print("\n=== Processing Complete ===");
};

// Run the main function
main();
