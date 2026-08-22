# S-PLUS Data Processing Utility
# Main entry point and configuration

# Define default settings
default_settings <- list(
  na_action = "remove",
  transform_type = "z-score",
  verbose = TRUE
)

# Main execution function
run_pipeline <- function(data_file, settings = default_settings) {
  cat("Starting S-PLUS Data Processing Pipeline...\n")
  
  # Step 1: Load Data
  cat("Loading data from:", data_file, "\n")
  data <- tryCatch(
    read.csv(data_file),
    error = function(e) {
      cat("Error loading data:", e$message, "\n")
      return(NULL)
    }
  )
  
  if (is.null(data)) {
    return(FALSE)
  }
  
  # Step 2: Validate
  cat("Validating data...\n")
  validation_result <- validate_data(data, settings$na_action)
  if (!validation_result$valid) {
    cat("Validation failed. Issues found:\n")
    print(validation_result$issues)
    if (!settings$verbose) return(FALSE)
  } else {
    cat("Data validation passed.\n")
  }
  
  # Step 3: Transform
  cat("Transforming data...
  transformed_data <- transform_data(data, settings$transform_type)
  
  # Step 4: Report
  cat("Generating report...\n")
  generate_report(transformed_data)
  
  cat("Pipeline completed successfully.\n")
  return(transformed_data)
}

# Export the main function if used as a library
if (!interactive()) {
  # Allow sourcing
}
