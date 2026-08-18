using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using AdvancedDataProcessing.Models;

namespace AdvancedDataProcessing.Validators
{
    /// <summary>
    /// Enforces business rules and data integrity constraints.
    /// </summary>
    public class DataValidator
    {
        private readonly List<ProcessingError> _errors = new List<ProcessingError>();

        public List<DataRecord> Validate(List<DataRecord> records)
        {
            _errors.Clear();
            var validRecords = new List<DataRecord>();

            foreach (var record in records)
            {
                if (IsRecordValid(record))
                {
                    validRecords.Add(record);
                }
                else
                {
                    Console.WriteLine($"[VALIDATION FAILED] Record {record.Id} was rejected.");
                }
            }

            return validRecords;
        }

        private bool IsRecordValid(DataRecord record)
        {
            bool isValid = true;

            // Rule 1: Name must not be "Unknown" (which implies missing data)
            if (record.Name == "Unknown")
            {
                _errors.Add(new ProcessingError 
                { 
                    RecordId = record.Id, 
                    Field = "Name", 
                    Message = "Name cannot be default value 'Unknown'",
                    RawValue = record.Name 
                });
                isValid = false;
            }

            // Rule 2: Age must be between 0 and 120
            if (record.Age < 0 || record.Age > 120)
            {
                _errors.Add(new ProcessingError
                {
                    RecordId = record.Id,
                    Field = "Age",
                    Message = $"Age out of range (0-120): {record.Age}",
                    RawValue = record.Age.ToString()
                });
                isValid = false;
            }

            // Rule 3: Email must match standard email pattern
            if (!IsValidEmail(record.Email))
            {
                _errors.Add(new ProcessingError
                {
                    RecordId = record.Id,
                    Field = "Email",
                    Message = "Invalid email format",
                    RawValue = record.Email
                });
                isValid = false;
            }

            // Rule 4: Score must be between 0.0 and 100.0
            if (record.Score < 0.0m || record.Score > 100.0m)
            {
                _errors.Add(new ProcessingError
                {
                    RecordId = record.Id,
                    Field = "Score",
                    Message = $"Score out of range (0.0-100.0): {record.Score}",
                    RawValue = record.Score.ToString()
                });
                isValid = false;
            }

            return isValid;
        }

        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            // Standard email regex pattern
            var emailPattern = @"^[^@
]+@[^@
]+.[^@
]+$";
            return Regex.IsMatch(email, emailPattern);
        }
    }
}
