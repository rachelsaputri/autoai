using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace ApiTrafficAnalyzer
{
    public class SecureLogger
    {
        private readonly ILogger<SecureLogger> _log;

        public SecureLogger(ILogger<SecureLogger> log)
        {
            _log = log;
        }

        public async Task LogAsync(ValidationReport report, CancellationToken token)
        {
            if (report.IsAnomalous || report.RateLimitExceeded)
            {
                _log.LogWarning("[SECURITY ALERT] Anomalies detected at {Timestamp}: {Threats}", report.Timestamp, string.Join(", ", report.ThreatsDetected));
                
                // Simulate secure storage write
                await StoreLogSecurely(report, token).ConfigureAwait(false);
            }
            else
            {
                _log.LogInformation("[OK] Request validated successfully at {Timestamp}", report.Timestamp);
            }
        }

        private async Task StoreLogSecurely(ValidationReport report, CancellationToken token)
        {
            // Placeholder for secure writing to disk or encrypted log storage
            await Task.Delay(10, token).ConfigureAwait(false);
        }
    }
}
