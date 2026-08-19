function generate_report(data, output_file)
    // Generates a text report with summary statistics of the data
    // Saves to output_file
    
    if ~exists("output_file") then output_file = "data_report.txt"; end
    
    fid = fopen(output_file, "w");
    if fid < 0 then
        error("Could not open file " + output_file + " for writing.");
    end
    
    fprintf(fid, "Data Processing Report\n");
    fprintf(fid, "======================\n");
    fprintf(fid, "Rows: %d\n", size(data, 1));
    fprintf(fid, "Columns: %d\n", size(data, 2));
    fprintf(fid, "\n");
    
    fprintf(fid, "Summary Statistics:\n");
    fprintf(fid, "-------------------\n");
    fprintf(fid, "%-15s %-15s %-15s %-15s\n", "Column", "Mean", "Std Dev", "Min", "Max");
    fprintf(fid, "%-15s %-15s %-15s %-15s\n", "------", "-----", "-------", "---", "---");
    
    for i = 1:size(data, 2)
        col_mean = mean(data(:, i));
        col_std = stdev(data(:, i));
        col_min = min(data(:, i));
        col_max = max(data(:, i));
        fprintf(fid, "%-15s %-15s %-15s %-15s\n", string(i), string(col_mean), string(col_std), string(col_min), string(col_max));
    end
    
    fprintf(fid, "\n");
    fprintf(fid, "End of Report\n");
    
    fclose(fid);
    disp("Report generated successfully: " + output_file);
endfunction
