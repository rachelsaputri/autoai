using System;
using System.Collections.Generic;
using System.Text.Json;

namespace ApiTrafficAnalyzer
{
    public class RequestParser
    {
        public StructuredRequest Parse(string rawJson)
        {
            try
            {
                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
                return JsonSerializer.Deserialize<StructuredRequest>(rawJson, options);
            }
            catch (JsonException ex)
            {
                throw new InvalidOperationException("Failed to parse raw request into structured format.", ex);
            }
        }
    }

    public class StructuredRequest
    {
        public string Method { get; set; }
        public string Path { get; set; }
        public Dictionary<string, string> Headers { get; set; }
        public Dictionary<string, object> Body { get; set; }
    }
}
