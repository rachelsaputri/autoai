# S-PLUS Data Processing Utility
# Reporting Module

# Generate summary statistics
summary_statistics <- function(data) {
  stats <- list(
    rows = nrow(data),
    columns = ncol(data),
    numeric_vars = sapply(data, is.numeric),
    factor_vars = sapply(data, is.factor),
    strings_vars = sapply(data, is.character)
  )
  
  # Add means for numeric columns
  numeric_cols <- names(data)[stats$numeric_vars]
  if (length(numeric_cols) > 0) {
    stats$means <- colMeans(data[numeric_cols], na.rm = TRUE)
  }
  
  return(stats)
}

# Print report to console
generate_report <- function(data) {
  stats <- summary_statistics(data)
  
  cat("\n--- Data Processing Report ---\n")
  cat("Total Rows:", stats$rows, "\n")
  cat("Total Columns:", stats$columns, "\n")
  cat("Numeric Columns:", sum(stats$numeric_vars), "\n")
  cat("Categorical Columns:", sum(stats$factor_vars | stats$strings_vars), "\n")
  
  if (!is.null(stats$means)) {
    cat("\n--- Numeric Column Means ---\n")
    print(stats$means)
  }
  
  cat("-------------------------------\n")
}
