using System;
using System.Collections.Generic;
using AdvancedDataProcessing.Models;

namespace AdvancedDataProcessing.Transformers
{
    /// <summary>
    /// Applies transformation logic to records, such as enrichment, formatting, and calculation.
    /// </summary>
    public class DataTransformer
    {
        public List<DataRecord> Transform(List<DataRecord> records)
        {
            if (records == null)
                return new List<DataRecord>();

            var transformed = new List<DataRecord>();

            foreach (var record in records)
            {
                // Clone the record to avoid mutating the original if needed, 
                // though here we modify in place for simplicity in this example.
                var transformedRecord = record;

                // Transformation 1: Status Logic based on Score
                if (transformedRecord.Score >= 90)
                {
                    transformedRecord.Status = "Gold";
                }
                else if (transformedRecord.Score >= 70)
                {
                    transformedRecord.Status = "Silver";
                }
                else if (transformedRecord.Score >= 50)
                {
                    transformedRecord.Status = "Bronze";
                }
                else
                {
                    transformedRecord.Status = "Standard";
                }

                // Transformation 2: Normalize Name to Title Case
                transformedRecord.Name = ToTitleCase(transformedRecord.Name);

                // Transformation 3: Generate a Hashed ID for anonymity (simulated)
                transformedRecord.Id = GenerateHashedId(transformedRecord.Id);

                transformed.Add(transformedRecord);
            }

            return transformed;
        }

        private string ToTitleCase(string input)
        {
            if (string.IsNullOrEmpty(input))
                return input;

            var wordPattern = new System.Text.RegularExpressions.Regex(@"(?<!
)([a-z'])");
            // Simple title case: Capitalize first letter of each word
            // Note: In production, use System.Globalization.TextInfo.ToTitleCase
            // but we'll stick to basic regex or string manipulation for clarity without extra imports
            
            // Actually, let's use standard .NET TextInfo for correctness
            var culture = new System.Globalization.CultureInfo(System.Globalization.CultureInfo.CurrentCulture.Name);
            var textInfo = culture.TextInfo;
            
            return textInfo.ToTitleCase(input.ToLower());
        }

        private string GenerateHashedId(string originalId)
        {
            // Simple hash for demonstration purposes
            uint hash = 5381;
            foreach (char c in originalId)
            {
                hash = ((hash << 5) + hash) + c; // hash * 33 + c
            }
            return $"HDR-{hash:X8}";
        }
    }
}
