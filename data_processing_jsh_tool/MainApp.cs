using System;
using System.Collections;
using JshDataProcessor;

namespace JshDataProcessor
{
    public class MainApp
    {
        public static void Main(string[] args)
        {
            if (args.Length < 2)
            {
                Console.WriteLine("Usage: MainApp.exe <input.csv> <output.csv> [filter_expression]");
                Console.WriteLine("Example: MainApp.exe data.csv result.csv age>25");
                return;
            }

            string inputFile = args[0];
            string outputFile = args[1];
            string filterExpression = (args.Length > 2) ? args[2] : null;

            try
            {
                Console.WriteLine("Loading data from: " + inputFile);
                DataProcessor processor = new DataProcessor(inputFile);
                ArrayList records = processor.LoadData();
                Console.WriteLine("Loaded " + records.Count + " records.");

                if (!string.IsNullOrEmpty(filterExpression))
                {
                    Console.WriteLine("Applying filter: " + filterExpression);
                    ArrayList filteredRecords = FilterRecords(records, filterExpression);
                    records = filteredRecords;
                    Console.WriteLine("Filtered to " + records.Count + " records.");
                }

                Console.WriteLine("Saving processed data to: " + outputFile);
                processor.SaveData(records, outputFile);
                Console.WriteLine("Processing complete.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                Environment.Exit(1);
            }
        }

        private static ArrayList FilterRecords(ArrayList records, string expression)
        {
            ArrayList filtered = new ArrayList();
            string[] parts = expression.Split(new char[] { '>' }, 2);
            if (parts.Length != 2)
            {
                Console.WriteLine("Warning: Invalid filter expression. Skipping filter.");
                return records;
            }

            string field = parts[0].Trim();
            double threshold = 0;
            if (!double.TryParse(parts[1].Trim(), out threshold))
            {
                Console.WriteLine("Warning: Invalid threshold in filter. Skipping filter.");
                return records;
            }

            foreach (Record record in records)
            {
                double value = DataProcessor.ParseDoubleOrNull(record.GetFieldValue(field));
                if (!double.IsNaN(value) && value > threshold)
                {
                    filtered.Add(record);
                }
            }
            return filtered;
        }
    }
}
