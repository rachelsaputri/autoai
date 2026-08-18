using System;
using System.Collections.Generic;
using System.Globalization;
using AdvancedDataProcessing.Models;

namespace AdvancedDataProcessing.Parsers
{
    /// <summary>
    /// Handles conversion of raw string data into structured DataRecord objects.
    /// </summary>
    public class DataParser
    {
        public List<DataRecord> ParseRecords(List<Dictionary<string, string>> rawInput)
        {
            var records = new List<DataRecord>();

            if (rawInput == null || rawInput.Count == 0)
            {
                return records;
            }

            foreach (var row in rawInput)
            {
                try
                {
                    var record = new DataRecord();

                    // Parse Id
                    if (row.ContainsKey("Id") && !string.IsNullOrWhiteSpace(row["Id"]))
                    {
                        record.Id = row["Id"].Trim();
                    }
                    else
                    {
                        record.Id = Guid.NewGuid().ToString(); // Auto-generate if missing
                    }

                    // Parse Name
                    record.Name = row.ContainsKey("Name") ? row["Name"].Trim() : "Unknown";

                    // Parse Age
                    if (row.ContainsKey("Age") && int.TryParse(row["Age"], NumberStyles.Integer, CultureInfo.InvariantCulture, out int age))
                    {
                        record.Age = age;
                    }
                    else
                    {
                        record.Age = 0; // Default invalid age to 0
                    }

                    // Parse Email
                    record.Email = row.ContainsKey("Email") ? row["Email"].Trim() : string.Empty;

                    // Parse Score
                    if (row.ContainsKey("Score") && decimal.TryParse(row["Score"], NumberStyles.Number, CultureInfo.InvariantCulture, out decimal score))
                    {
                        record.Score = score;
                    }
                    else
                    {
                        record.Score = 0.0m;
                    }

                    records.Add(record);
                }
                catch (Exception ex)
                {
                    // Log error and skip record if parsing fails completely
                    Console.WriteLine($"[PARSE ERROR] Skipping record due to critical parsing failure: {ex.Message}");
                }
            }

            return records;
        }
    }
}
