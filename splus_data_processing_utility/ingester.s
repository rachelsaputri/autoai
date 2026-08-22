# S-PLUS Data Processing Utility
# Ingestion Module

# Load raw data
load_dataset <- function(file_path) {
  # Supports CSV for now
  if (endsWith(file_path, ".csv")) {
    data <- read.csv(file_path, stringsAsFactors = FALSE)
  } else {
    stop("Unsupported file format. Only CSV is supported.")
  }
  return(data)
}

# Stream data from memory (for testing or advanced use)
stream_dataset <- function(data_frame) {
  if (!is.data.frame(data_frame)) {
    stop("Input must be a data frame.")
  }
  return(data_frame)
}
