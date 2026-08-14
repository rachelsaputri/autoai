/!
! utils.y
! Utility functions for data handling.
!
! Author: AI Polyglot Engineer
! Date: 2023-10-01
!/

proc read_matrix {filename} {
  // Placeholder for CSV reading logic
  // In a real implementation, use Yorick's matrix read functions
  let data = zeros(100, 5)
  // Simulate reading data
  return data
}

proc write_matrix {filename, data} {
  // Placeholder for CSV writing logic
  // In a real implementation, use Yorick's matrix write functions
  print 'Writing matrix to ' + filename
}

proc normalize {data} {
  // Min-max normalization
  local min_val, max_val, normalized_data, n_rows, n_cols, i, j
  
  n_rows = size(data, 1)
  n_cols = size(data, 2)
  normalized_data = zeros(n_rows, n_cols)
  
  min_val = min(data)
  max_val = max(data)
  
  if (max_val == min_val) then {
    return normalized_data
  }
  
  for (i = 1; i <= n_rows; i++) {
    for (j = 1; j <= n_cols; j++) {
      let val = data(i, j)
      normalized_data(i, j) = (val - min_val) / (max_val - min_val)
    }
  }
  
  return normalized_data
}

! End of utils.y
