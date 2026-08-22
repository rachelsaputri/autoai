# S-PLUS Data Processing Utility
# Validation Module

# Check for structural integrity and missing values
validate_data <- function(data, na_action) {
  issues <- list()
  valid <- TRUE
  
  # Check for empty data
  if (nrow(data) == 0 || ncol(data) == 0) {
    issues$empty_data <- TRUE
    valid <- FALSE
  }
  
  # Check for missing values
  missing_counts <- colSums(is.na(data))
  if (any(missing_counts > 0)) {
    issues$missing_values <- missing_counts[missing_counts > 0]
    valid <- FALSE # Treat missing values as issues
  }
  
  # Check for duplicated rows
  duplicated_indices <- duplicated(data)
  if (any(duplicated_indices)) {
    issues$duplicates <- sum(duplicated_indices)
    valid <- FALSE
  }
  
  result <- list(
    valid = valid,
    issues = issues,
    original_data = data
  )
  
  return(result)
}
