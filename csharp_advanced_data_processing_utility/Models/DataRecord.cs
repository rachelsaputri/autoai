using System;
using System.Collections.Generic;

namespace AdvancedDataProcessing.Models
{
    /// <summary>
    /// Represents a single record in the data processing pipeline.
    /// </summary>
    public class DataRecord
    {
        public string Id { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public int Age { get; set; }
        public string Email { get; set; } = string.Empty;
        public decimal Score { get; set; }
        public DateTime ProcessedAt { get; set; } = DateTime.UtcNow;
        public string Status { get; set; } = "Active";

        public override string ToString()
        {
            return $"Id: {Id}, Name: {Name}, Age: {Age}, Email: {Email}, Score: {Score}, Status: {Status}, ProcessedAt: {ProcessedAt:yyyy-MM-dd HH:mm:ss}";
        }
    }

    /// <summary>
    /// Represents an error encountered during processing.
    /// </summary>
    public class ProcessingError
    {
        public string RecordId { get; set; } = string.Empty;
        public string Field { get; set; } = string.Empty;
        public string Message { get; set; } = string.Empty;
        public string RawValue { get; set; } = string.Empty;

        public override string ToString()
        {
            return $"Error in Record '{RecordId}' Field '{Field}': {Message} (Value: '{RawValue}')";
        }
    }
}
