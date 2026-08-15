using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ApiTrafficAnalyzer
{
    public class InterceptorService : BackgroundService
    {
        private readonly RequestParser _parser;
        private readonly ValidatorEngine _validator;
        private readonly SecureLogger _logger;
        private readonly ILogger<InterceptorService> _log;

        public InterceptorService(RequestParser parser, ValidatorEngine validator, SecureLogger logger, ILogger<InterceptorService> log)
        {
            _parser = parser;
            _validator = validator;
            _logger = logger;
            _log = log;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _log.LogInformation("InterceptorService is starting.");
            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    var rawRequest = await CaptureIncomingRequest(stoppingToken).ConfigureAwait(false);
                    if (rawRequest != null)
                    {
                        var structuredRequest = _parser.Parse(rawRequest);
                        var validationResults = _validator.Validate(structuredRequest);
                        await _logger.LogAsync(validationResults, stoppingToken).ConfigureAwait(false);
                    }
                }
                catch (Exception ex)
                {
                    _log.LogError(ex, "Error processing request in InterceptorService.");
                }
                await Task.Delay(100, stoppingToken).ConfigureAwait(false);
            }
            _log.LogInformation("InterceptorService is stopping.");
        }

        private async Task<string> CaptureIncomingRequest(CancellationToken token)
        {
            // Placeholder for actual network capture logic (e.g., using HttpListener or a reverse proxy hook)
            // Simulating an incoming request for demonstration
            return "{ \"method\": \"POST\", \"path\": \"/api/data\", \"headers\": { \"Authorization\": \"Bearer valid_token\" }, \"body\": { \"payload\": \"test_data\" } }";
        }
    }
}
