using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using AdvancedDataProcessing.Models;

namespace AdvancedDataProcessing.Exporters
{
    /// <summary>
    /// Handles writing processed data to various file formats.
    /// </summary>
    public class DataExporter
    {
        /// <summary>
        /// Exports the list of DataRecords to a CSV file.
        /// </summary>
        public async Task ExportToCsv(List<DataRecord> records, string filePath)
        {
            if (records == null || records.Count == 0)
            {
                throw new ArgumentException("No records to export.");
            }

            using (var writer = new StreamWriter(filePath, false, Encoding.UTF8))
            {
                // Write Header
                await writer.WriteLineAsync("Id,Name,Age,Email,Score,Status,ProcessedAt");

                // Write Data Rows
                foreach (var record in records)
                {
                    // Escape double quotes in strings for CSV compliance
                    var safeName = EscapeCsvField(record.Name);
                    var safeEmail = EscapeCsvField(record.Email);
                    var safeStatus = EscapeCsvField(record.Status);

                    await writer.WriteLineAsync(
                        $"\"{record.Id}\",\"{safeName}\",\"{record.Age}\",\"{safeEmail}\",\"{record.Score}\",\"{safeStatus}\",\"{record.ProcessedAt:yyyy-MM-dd HH:mm:ss}\"");
                }
            }
        }

        /// <summary>
        /// Helper to escape fields containing commas, quotes, or newlines.
        /// </summary>
        private string EscapeCsvField(string field)
        {
            if (string.IsNullOrEmpty(field))
                return string.Empty;
                
            if (field.Contains(",") || field.Contains("\"") || field.Contains("\n") || field.Contains("\r"))
            {
                return field.Replace("\"", "\"\"");
            }
            return field;
        }
    }
}
