/**
 * validator.gp
 * Functions for data validation and integrity checks.
 */

/**
 * validator_validate_matrix(matrix)
 * Validates the structure and content of a data matrix.
 * 
 * Output:
 *   [status: bool, message: string]
 */
validator_validate_matrix(matrix) = {
    if (!ismatrix(matrix), return [0, "Input is not a matrix"]);
    
    local dims = matsize(matrix);
    local rows = dims[1];
    local cols = dims[2];
    
    if (rows == 0 || cols == 0, return [0, "Matrix is empty"]);
    
    // Check for complex numbers (ensure real data)
    for (i = 1, rows,
        for (j = 1, cols,
            if (iscomplex(matrix[i, j]),
                return [0, "Complex numbers found at row " * i ", col " * j]
            );
        );
    );
    
    // Check for missing values (NaN/Inf handling if applicable, though PARI handles real/complex)
    // In PARI/GP, we primarily check for valid numeric types.
    // Since eval() in parser converts strings to numbers, we assume numeric.
    
    return [1, "Validation passed"];
};

/**
 * validator_check_outliers(vector, threshold)
 * Checks for outliers in a vector using Z-score method.
 * 
 * Output:
 *   List of indices of outliers
 */
validator_check_outliers(vector, threshold) = {
    if (!isvector(vector), error("Input is not a vector"));
    
    local n = #vector;
    if (n == 0, return List([]));
    
    // Calculate mean
    local mean = vecsum(vector) / n;
    
    // Calculate variance
    local variance = vecsum(vector~ * vector) / n - mean^2;
    
    // Handle zero variance
    if (variance <= 0, return List([]));
    
    local std_dev = sqrt(variance);
    local outliers = List([]);
    
    for (i = 1, n,
        local z_score = abs(vector[i] - mean) / std_dev;
        if (z_score > threshold,
            listinsert(outliers, i, #outliers + 1);
        );
    );
    
    return Vec(outliers);
};
