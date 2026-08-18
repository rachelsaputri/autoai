using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AdvancedDataProcessing.Models;
using AdvancedDataProcessing.Parsers;
using AdvancedDataProcessing.Transformers;
using AdvancedDataProcessing.Validators;
using AdvancedDataProcessing.Exporters;

namespace AdvancedDataProcessing
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            Console.WriteLine("Starting Advanced Data Processing Utility...");

            // 1. Define Sample Input Data (Simulating a file read)
            var inputRecords = new List<Dictionary<string, string>>
            {
                new Dictionary<string, string> { ["Id"] = "1", ["Name"] = "Alice", ["Age"] = "30", ["Email"] = "alice@example.com", ["Score"] = "85.5" },
                new Dictionary<string, string> { ["Id"] = "2", ["Name"] = "Bob", ["Age"] = "25", ["Email"] = "invalid-email", ["Score"] = "92.0" },
                new Dictionary<string, string> { ["Id"] = "3", ["Name"] = "Charlie", ["Age"] = "17", ["Email"] = "charlie@example.com", ["Score"] = "45.2" },
                new Dictionary<string, string> { ["Id"] = "4", ["Name"] = "Diana", ["Age"] = "28", ["Email"] = "diana@example.com", ["Score"] = "88.9" },
                new Dictionary<string, string> { ["Id"] = "5", ["Name"] = "Eve", ["Age"] = "35", ["Email"] = "eve@example.com", ["Score"] = "ABC" } // Invalid Score
            };

            try
            {
                // 2. Parse: Convert raw dictionaries to DataRecord objects
                Console.WriteLine("[1/4] Parsing data...");
                var parser = new DataParser();
                var parsedRecords = parser.ParseRecords(inputRecords);
                Console.WriteLine($"   Parsed {parsedRecords.Count} records.");

                // 3. Validate: Filter out invalid records
                Console.WriteLine("[2/4] Validating data...");
                var validator = new DataValidator();
                var validRecords = validator.Validate(parsedRecords);
                Console.WriteLine($"   Kept {validRecords.Count} valid records out of {parsedRecords.Count}.");

                // 4. Transform: Enrich and format records
                Console.WriteLine("[3/4] Transforming data...");
                var transformer = new DataTransformer();
                var transformedRecords = transformer.Transform(validRecords);
                Console.WriteLine("   Transformation complete.");

                // 5. Export: Write to CSV
                Console.WriteLine("[4/4] Exporting data...");
                var exporter = new DataExporter();
                var outputFilePath = "output_processed_data.csv";
                await exporter.ExportToCsv(transformedRecords, outputFilePath);
                Console.WriteLine($"   Exported to '{outputFilePath}'.");

                Console.WriteLine("\nProcessing completed successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"\nAn error occurred during processing: {ex.Message}");
                Console.WriteLine(ex.StackTrace);
            }
            finally
            {
                Console.WriteLine("\nUtility shutting down...");
            }
        }
    }
}
