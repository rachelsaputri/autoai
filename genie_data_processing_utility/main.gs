using Gee;
using GLib;
using Json;

public class DataProcessingUtility : Object {
    
    private string input_file;
    private string output_file;
    private Logger logger = new Logger();
    private DataProcessor processor;
    private DataValidator validator;
    private ReportGenerator reporter;
    
    public static int main (string[] args) {
        // Simple CLI argument parsing
        if (args.length < 1) {
            print("Usage: genie_dpu --input <file.json> [options]\n");
            return 1;
        }
        
        string? input_path = null;
        
        for (int i = 0; i < args.length; i++) {
            if (args[i] == "--input" && i + 1 < args.length) {
                input_path = args[i+1];
                i++; // Skip next arg
            }
        }
        
        if (input_path == null) {
            print("Error: Input file path is required.\n");
            return 1;
        }
        
        var utility = new DataProcessingUtility();
        
        try {
            utility.run(input_path);
        } catch (Exception e) {
            Utility.printerr("Error: %s\n".printf(e.message));
            return 1;
        }
        
        return 0;
    }
    
    public void run (string input_path) throws Exception {
        logger.info("Starting Data Processing Utility");
        logger.info("Input File: %s".printf(input_path));
        
        // 1. Ingest Data
        var data = DataEngine.ingest(input_path);
        if (data == null || data.get_length() == 0) {
            throw new Exception("Failed to ingest data or file is empty.");
        }
        logger.info("Ingested %d records.".printf(data.get_length()));
        
        // 2. Validate Data
        validator = new DataValidator();
        var valid_records = validator.validate(data);
        logger.info("Validated records: %d".printf(valid_records.get_length()));
        
        if (valid_records.get_length() == 0) {
            throw new Exception("No valid records found after validation.");
        }
        
        // 3. Process Data
        processor = new DataProcessor();
        var processed_data = processor.transform(valid_records);
        logger.info("Processed %d records.".printf(processed_data.get_length()));
        
        // 4. Generate Report
        reporter = new ReportGenerator();
        var report = reporter.generate(processed_data);
        logger.info("Report generated successfully.");
        print(report);
        
        logger.info("Data Processing Complete.");
    }
}

// Logger Class
class Logger : Object {
    public void info (string message) {
        print("[INFO] %s\n".printf(message));
    }
    
    public void error (string message) {
        print("[ERROR] %s\n".printf(message));
    }
    
    public void debug (string message) {
        print("[DEBUG] %s\n".printf(message));
    }
}

// Data Engine Class (Ingestion)
class DataEngine : Object {
    public static Gee.ArrayList<Object>? ingest (string path) throws Exception {
        var file = File.new_for_path(path);
        if (!file.query_exists(null)) {
            throw new FileError.NOT_FOUND("File not found: %s".printf(path));
        }
        
        var stream = file.open_read(null);
        var input = new DataInputStream(stream);
        var content = input.read_until(null, 0, null);
        input.close(null);
        
        var parser = new Json.Parser();
        parser.load_from_data(content, -1);
        
        var root = parser.get_root();
        
        if (root.get_node_type() == Json.NodeType.ARRAY) {
            var array_node = root.get_array();
            var list = new Gee.ArrayList<Object>();
            for (int i = 0; i < array_node.get_length(); i++) {
                list.add(array_node.get_element(i));
            }
            return list;
        } else if (root.get_node_type() == Json.NodeType.OBJECT) {
            var list = new Gee.ArrayList<Object>();
            list.add(root);
            return list;
        }
        
        return null;
    }
}

// Validator Class
class DataValidator : Object {
    public Gee.ArrayList<Object> validate (Gee.ArrayList<Object> data) {
        var valid_data = new Gee.ArrayList<Object>();
        
        foreach (var item in data) {
            if (is_valid(item)) {
                valid_data.add(item);
            }
        }
        
        return valid_data;
    }
    
    private bool is_valid (Object item) {
        // Simple validation: check if it's a valid Json node
        if (item is Json.Node) {
            return true;
        }
        return false;
    }
}

// Processor Class
class DataProcessor : Object {
    public Gee.ArrayList<Object> transform (Gee.ArrayList<Object> data) {
        var processed = new Gee.ArrayList<Object>();
        
        foreach (var item in data) {
            if (item is Json.Node) {
                var node = (Json.Node) item;
                if (node.get_node_type() == Json.NodeType.OBJECT) {
                    var object = node.get_object();
                    object.set_string_value("status", "processed");
                    processed.add(node);
                }
            }
        }
        
        return processed;
    }
}

// Reporter Class
class ReportGenerator : Object {
    public string generate (Gee.ArrayList<Object> data) {
        var sb = new StringBuilder();
        sb.append("=== Data Processing Report ===\n");
        sb.append("Total Processed Records: %d\n".printf(data.get_length()));
        sb.append("\nDetails:\n");
        
        foreach (var item in data) {
            if (item is Json.Node) {
                sb.append(" - Record processed successfully.\n");
            }
        }
        
        return sb.str;
    }
}
