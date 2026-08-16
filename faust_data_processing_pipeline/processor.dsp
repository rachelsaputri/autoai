// Data Processor
// This module contains the core processing logic for the data pipeline.

import "types";

// Filter out invalid data points
let filter_invalid(points: Array[DataPoint]) =
  points
    .filter((point) -> point.id != "" and point.value is not null)
    .filter((point) -> point.timestamp > 0);

// Map fields to standardized format
let map_fields(points: Array[DataPoint]) =
  points
    .map((point) -> {
      "id": string.upper(point.id),
      "timestamp": point.timestamp,
      "value": point.value,
      "tags": point.tags.map(string.lower),
      "metadata": point.metadata
    });

// Aggregate data points by timestamp
let aggregate(points: Array[DataPoint]) =
  let grouped = points.group_by((point) -> int.floor(point.timestamp / 1000)) in
  grouped
    .map((key, values) -> {
      "timestamp": key * 1000,
      "count": values.length,
      "avg_value": values.reduce(0, (acc, val) -> acc + val.value) / values.length,
      "min_value": values.reduce(values[0].value, (acc, val) -> min(acc, val.value)),
      "max_value": values.reduce(values[0].value, (acc, val) -> max(acc, val.value))
    });

// Process a single data point
let process_single(point: DataPoint) =
  let normalized_value = utils.normalize_value(point.value) in
  {
    "id": point.id,
    "timestamp": point.timestamp,
    "value": normalized_value,
    "tags": point.tags,
    "metadata": point.metadata
  };

export filter_invalid;
export map_fields;
export aggregate;
export process_single;
