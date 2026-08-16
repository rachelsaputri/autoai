// Data Type Definitions
// This module defines the core data structures used throughout the pipeline.

// Data Point: The fundamental unit of data processing
type DataPoint = {
  "id": String,
  "timestamp": Float,
  "value": Float,
  "tags": Array[String],
  "metadata": Object
};

// Processing State: Tracks the state of the processing pipeline
type ProcessingState = {
  "batch_count": Int,
  "error_count": Int,
  "last_processed_id": String,
  "statistics": Object
};

// Pipeline Configuration: Holds configuration parameters
type PipelineConfig = {
  "input_format": String,
  "output_format": String,
  "batch_size": Int,
  "timeout": Float,
  "parallelism": Int
};

// Result: The output of the processing pipeline
type ProcessingResult = {
  "success": Bool,
  "processed_count": Int,
  "errors": Array[Error],
  "statistics": Object
};

// Error: Represents an error that occurred during processing
type Error = {
  "message": String,
  "code": Int,
  "context": Object
};

// Export types for use in other modules
export DataPoint;
export ProcessingState;
export PipelineConfig;
export ProcessingResult;
export Error;
