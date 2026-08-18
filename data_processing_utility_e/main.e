"import org.e.lang.Console
import org.e.lang.System
import data_ingester
import data_transformer
import data_validator
import reporter

\"\"\"\nThe main entry point for the E Language Data Processing Utility.\nIt orchestrates the data ingestion, transformation, validation, and reporting process.\n\"\"\"\n

function main(String[] args) {
    Console.println(\"Starting Data Processing Utility...\")
    
    // Define sample data for demonstration
    String sampleData = \"{\\\"name\\\": \\\"Alice\\\", \\\"age\\\": 30, \\\"city\\\": \\\"Wonderland\\\"}\\n{\\\"name\\\": \\\"Bob\\\", \\\"age\\\": 25, \\\"city\\\": \\\"Utopia\\\"}\\n{\\\"name\\\": \\\"Charlie\\\", \\\"age\\\": 35, \\\"city\\\": \\\"Atlantis\\\"}\"
    
    // Step 1: Ingest Data
    List<String> ingestedData = DataIngester.ingest(sampleData, \"json\")
    Console.println(\"Ingested Data:\")
    for (String record : ingestedData) {
        Console.println(\"  \\\" + record + \"\")
    }
    
    // Step 2: Transform Data
    List<String> transformedData = DataTransformer.transform(ingestedData, \"uppercase_name\")
    Console.println(\"\\nTransformed Data:\")
    for (String record : transformedData) {
        Console.println(\"  \\\" + record + \"\")
    }
    
    // Step 3: Validate Data
    Boolean validationPassed = DataValidator.validate(transformedData, \"required_fields\")
    if (validationPassed) {
        Console.println(\"\\nData Validation Passed!\")
    } else {
        Console.println(\"\\nData Validation Failed!\")
    }
    
    // Step 4: Generate Report
    Reporter.generateReport(transformedData, validationPassed)
    
    Console.println(\"\\nData Processing Complete.\")
}
