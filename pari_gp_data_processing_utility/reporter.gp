/**
 * reporter.gp
 * Functions for generating reports and statistical summaries.
 */

/**
 * reporter_print_summary(matrix)
 * Prints a summary of the matrix including dimensions, row/column counts, and basic stats.
 */
reporter_print_summary(matrix) = {
    if (!ismatrix(matrix), error("Input is not a matrix"));
    
    local dims = matsize(matrix);
    local rows = dims[1];
    local cols = dims[2];
    
    print("  Matrix Dimensions: " * rows * " x " * cols);
    print("  Total Elements: " * (rows * cols));
    
    if (rows > 0 && cols > 0, 
        print("  Global Min: " * matsimpl(matrix));
        print("  Global Max: " * matmax(matrix));
        print("  Global Sum: " * vecsum(matreduce(matrix, "+", matrix)));
        
        // Column-wise stats
        print("  Column Means:");
        for (j = 1, cols,
            local col = parser_get_column(matrix, j);
            local mean = vecsum(col) / rows;
            print("    Col " * j ": " * mean);
        );
    );
};

/**
 * reporter_export_csv(matrix, filename)
 * Exports a matrix to a CSV-formatted string.
 * 
 * Output:
 *   String containing CSV data
 */
reporter_export_csv(matrix) = {
    if (!ismatrix(matrix), error("Input is not a matrix"));
    
    local dims = matsize(matrix);
    local rows = dims[1];
    local cols = dims[2];
    local result = "";
    
    for (i = 1, rows,
        for (j = 1, cols,
            if (j > 1, result = result ",");
            result = result Str(matrix[i, j]);
        );
        result = result "\n";
    );
    
    return result;
};
