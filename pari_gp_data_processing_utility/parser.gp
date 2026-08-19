/**
 * parser.gp
 * Functions for data ingestion and parsing.
 * Handles conversion of string data (CSV format) to PARI/GP matrices.
 */

/**
 * parser_parse_csv(str, skip_header)
 * Parses a CSV-formatted string into a PARI/GP matrix.
 * 
 * Inputs:
 *   str       : String containing CSV data
 *   skip_header: Boolean, if true, the first row is treated as headers and skipped
 * 
 * Output:
 *   A PARI/GP matrix of numbers
 */
parser_parse_csv(str, skip_header) = {
    local lines, parts, data, i, j, row;
    
    // Split string into lines
    lines = strsplit(str, "\n");
    
    // Remove empty lines
    lines = select(line -> line != "", lines);
    
    if (length(lines) == 0, return Mat([]));
    
    // Determine starting index
    local start_idx = 1;
    if (skip_header && length(lines) > 0, start_idx = 2);
    
    if (length(lines) < start_idx, return Mat([]));
    
    // Prepare data list
    data = List([]);
    
    for (i = start_idx, length(lines),
        parts = strsplit(lines[i], ",");
        row = List([]);
        
        for (j = 1, length(parts),
            local val = StrChr(parts[j]); // Trim whitespace
            if (val == "", val = "0"); // Handle empty fields
            listinsert(row, eval(val), #row + 1);
        );
        
        listinsert(data, Vec(row), #data + 1);
    );
    
    // Convert list of vectors to matrix
    if (listlength(data) == 0, return Mat([]));
    
    return Mat(data);
};

/**
 * parser_get_column(matrix, col_idx)
 * Extracts a specific column from a matrix as a vector.
 */
parser_get_column(matrix, col_idx) = {
    if (!ismatrix(matrix), error("Input is not a matrix"));
    local cols = matsize(matrix)[2];
    if (col_idx < 1 || col_idx > cols, error("Column index out of bounds"));
    
    return vector(rows(matrix), i, matrix[i, col_idx]);
};
