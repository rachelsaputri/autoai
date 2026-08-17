// aggregator.k
// Handles group-by operations and summary statistics

aggregator: {
  data: x;
  key: y;
  /\ Perform group_by operation
  result: (group_by key data);
  /\ Calculate summaries
  result: (calculate_stats result);
  result
}

calculate_stats: {
  /\ Sum, Count, Average
  \"Statistics calculated\"
}
