function [data, meta] = ingest_data(filename)
    // Ingests data from a CSV file or generates sample data if filename is empty
    // Returns data matrix and metadata structure
    
    if filename == "" then
        // Generate sample data for testing
        data = rand(100, 5, "normal");
        meta.name = "Sample Data";
        meta.rows = size(data, 1);
        meta.cols = size(data, 2);
        return
    end
    
    try
        // Load CSV data
        [data, meta] = csvRead(filename);
        meta.name = filename;
        meta.format = "csv";
    catch
        error("Failed to ingest data from " + filename);
    end
endfunction
