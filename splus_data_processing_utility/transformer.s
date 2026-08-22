# S-PLUS Data Processing Utility
# Transformation Module

# Normalize numeric columns using Z-score
normalize_zscore <- function(data) {
  numeric_cols <- sapply(data, is.numeric)
  if (!any(numeric_cols)) return(data)
  
  transformed_data <- data
  for (col_name in names(data)[numeric_cols]) {
    col <- data[[col_name]]
    mean_val <- mean(col, na.rm = TRUE)
    sd_val <- sd(col, na.rm = TRUE)
    if (sd_val == 0) {
      transformed_data[[col_name]] <- 0
    } else {
      transformed_data[[col_name]] <- (col - mean_val) / sd_val
    }
  }
  return(transformed_data)
}

# Apply log transform to positive skew
log_transform <- function(data) {
  numeric_cols <- sapply(data, is.numeric)
  transformed_data <- data
  for (col_name in names(data)[numeric_cols]) {
    col <- data[[col_name]]
    # Add small constant to avoid log(0)
    transformed_data[[col_name]] <- log(col + 1)
  }
  return(transformed_data)
}

# Main transform dispatcher
transform_data <- function(data, type) {
  switch(type,
    "z-score" = normalize_zscore(data),
    "log" = log_transform(data),
    {
      cat("Unknown transform type:", type, "Returning original data.\n")
      data
    }
  )
}
