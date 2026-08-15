using System;
using System.Collections.Generic;
using System.Linq;

namespace ApiTrafficAnalyzer
{
    public class ValidatorEngine
    {
        public ValidationReport Validate(StructuredRequest request)
        {
            var report = new ValidationReport
            {
                Timestamp = DateTime.UtcNow,
                IsAnomalous = false,
                ComplianceStatus = "Pass",
                ThreatsDetected = new List<string>(),
                RateLimitExceeded = false
            };

            // 1. Authentication Validation
            if (!ValidateAuthHeader(request.Headers))
            {
                report.IsAnomalous = true;
                report.ThreatsDetected.Add("Invalid or Missing Authentication Token");
            }

            // 2. Rate Limiting Check (Simplified)
            if (IsRateLimited(request.Path))
            {
                report.RateLimitExceeded = true;
                report.ThreatsDetected.Add("Rate Limit Exceeded");
            }

            // 3. Path Compliance Check
            if (!IsValidPath(request.Path))
            {
                report.IsAnomalous = true;
                report.ThreatsDetected.Add("Non-Compliant API Path");
            }

            return report;
        }

        private bool ValidateAuthHeader(Dictionary<string, string> headers)
        {
            if (headers == null || !headers.ContainsKey("Authorization"))
                return false;
            var auth = headers["Authorization"];
            return auth.StartsWith("Bearer ") && auth.Length > 7;
        }

        private bool IsRateLimited(string path)
        {
            // Placeholder for actual rate limiting logic (e.g., sliding window counter)
            return false;
        }

        private bool IsValidPath(string path)
        {
            // Placeholder for allowed paths list
            return path.StartsWith("/api/");
        }
    }

    public class ValidationReport
    {
        public DateTime Timestamp { get; set; }
        public bool IsAnomalous { get; set; }
        public string ComplianceStatus { get; set; }
        public bool RateLimitExceeded { get; set; }
        public List<string> ThreatsDetected { get; set; }
    }
}
