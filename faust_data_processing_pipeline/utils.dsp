// Utility Functions
// This module contains helper functions for data processing.

import "types";

// Normalize a value to a 0-1 range
let normalize_value(value: Float) =
  if value > 0 then
    min(1.0, value / 100.0)
  else
    0.0;

// Normalize a stream of data points
let normalize(points: Stream[DataPoint]) =
  points.map((point) -> {
    "id": point.id,
    "timestamp": point.timestamp,
    "value": normalize_value(point.value),
    "tags": point.tags,
    "metadata": point.metadata
  });

// Read data from a stream
let read_stream(stream_path: String) =
  let file = open(stream_path, "r");
  let content = file.read();
  let parsed = json.parse(content);
  parsed
    .map((item) -> {
      "id": item.id,
      "timestamp": item.timestamp,
      "value": item.value,
      "tags": item.tags,
      "metadata": item.metadata
    });

// Write result to a stream
let write_result(stream_path: String, result: ProcessingResult) =
  let output = {
    "success": result.success,
    "processed_count": result.processed_count,
    "errors": result.errors,
    "statistics": result.statistics
  };
  let serialized = json.serialize(output);
  let file = open(stream_path, "w");
  file.write(serialized);
  file.close();

// Calculate statistics for a set of data points
let calculate_statistics(points: Array[DataPoint]) = {
  "count": points.length,
  "avg_value": points.reduce(0, (acc, point) -> acc + point.value) / points.length,
  "min_value": points.reduce(points[0].value, (acc, point) -> min(acc, point.value)),
  "max_value": points.reduce(points[0].value, (acc, point) -> max(acc, point.value)),
  "std_dev": points.reduce(0, (acc, point) -> acc + pow(point.value - calculate_average(points), 2)) / points.length
};

// Helper function to calculate average
let calculate_average(points: Array[DataPoint]) =
  points.reduce(0, (acc, point) -> acc + point.value) / points.length;

export normalize_value;
export normalize;
export read_stream;
export write_result;
export calculate_statistics;
