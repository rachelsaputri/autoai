/**
 * transformer.gp
 * Functions for data transformation and mathematical operations.
 */

/**
 * transformer_normalize(matrix)
 * Applies Z-score normalization to each column of the matrix.
 * 
 * Output:
 *   Normalized matrix
 */
transformer_normalize(matrix) = {
    if (!ismatrix(matrix), error("Input is not a matrix"));
    
    local dims = matsize(matrix);
    local rows = dims[1];
    local cols = dims[2];
    local result = matrix; // Copy matrix
    
    for (j = 1, cols,
        local col = parser_get_column(matrix, j);
        
        // Calculate mean
        local mean = vecsum(col) / rows;
        
        // Calculate standard deviation
        local variance = vecsum(col~ * col) / rows - mean^2;
        local std_dev = sqrt(variance);
        
        // Handle zero standard deviation
        if (std_dev == 0, std_dev = 1);
        
        // Normalize column
        for (i = 1, rows,
            result[i, j] = (matrix[i, j] - mean) / std_dev;
        );
    );
    
    return result;
};

/**
 * transformer_filter_by_column(matrix, col_idx, min_val, max_val)
 * Filters rows where the specified column is within [min_val, max_val].
 * 
 * Output:
 *   Filtered matrix
 */
transformer_filter_by_column(matrix, col_idx, min_val, max_val) = {
    if (!ismatrix(matrix), error("Input is not a matrix"));
    
    local dims = matsize(matrix);
    local rows = dims[1];
    local cols = dims[2];
    
    if (col_idx < 1 || col_idx > cols, error("Column index out of bounds"));
    
    local filtered_rows = List([]);
    
    for (i = 1, rows,
        local val = matrix[i, col_idx];
        if (val >= min_val && val <= max_val,
            listinsert(filtered_rows, matrix[i, ], #filtered_rows + 1);
        );
    );
    
    if (listlength(filtered_rows) == 0, return Mat([]));
    return Mat(filtered_rows);
};

/**
 * transformer_append_matrix(mat1, mat2)
 * Appends two matrices vertically (assuming same number of columns).
 * 
 * Output:
 *   Combined matrix
 */
transformer_append_matrix(mat1, mat2) = {
    if (!ismatrix(mat1) || !ismatrix(mat2), error("Inputs are not matrices"));
    
    local dims1 = matsize(mat1);
    local dims2 = matsize(mat2);
    
    if (dims1[2] != dims2[2], error("Matrices must have same number of columns"));
    
    return concat([mat1, mat2]);
};
