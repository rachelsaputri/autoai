// main.t
// TADS Data Processing Utility - Entry Point

class DataPipeline
    exec
    {
        main() {
            "Initializing TADS Data Processing Engine...\n";
            
            local ingester = new DataIngestor();
            local validator = new DataValidator();
            local transformer = new DataTransformer();
            local reporter = new ReportGenerator();
            
            local rawData = ingester.load();
            
            "Data Ingestion Complete. Records: <<rawData.length>>\n";
            
            local validated = validator.check(rawData);
            "Validation Complete. Passed: <<validated.length>>\n";
            
            local processed = transformer.transform(validated);
            "Transformation Complete.\n";
            
            reporter.generate(processed);
            "Processing Pipeline Finished.\n";
        }
    }

global datapipeline = new DataPipeline();

function main() {
    datapipeline.main();
}
