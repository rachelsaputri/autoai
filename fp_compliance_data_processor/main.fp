include "types.fp"
include "data_ingestor.fp"
include "data_transformer.fp"
include "data_validator.fp"
include "data_exporter.fp"

-- Main Entry Point
let
    main() =
        let
            input_file = "./input_data.csv"
            output_file = "./output_data.json"
            validation_rules = load_default_rules()
            
            -- Step 1: Ingest
            raw_data = ingest_csv(input_file)
            
            -- Step 2: Transform
            cleaned_data = transform_records(raw_data)
            
            -- Step 3: Validate
            validated_data = validate_records(cleaned_data, validation_rules)
            
            -- Step 4: Export
            export_json(output_file, validated_data)
            
            log_message("Processing complete. Output written to: " + output_file)
        in
            main()
        end
    
    load_default_rules() =
        [
            {field: "id", type: "integer", required: true},
            {field: "timestamp", type: "datetime", required: true},
            {field: "status", type: "string", required: true},
            {field: "amount", type: "float", required: false}
        ]
        
    log_message(msg) =
        print("[INFO] " + msg)
end

-- Start execution
main()
