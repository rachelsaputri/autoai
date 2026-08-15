using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace ApiTrafficAnalyzer
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();
            await host.RunAsync();
        }

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args)
                .ConfigureServices((context, services) =>
                {
                    services.AddHostedService<InterceptorService>();
                    services.AddSingleton<RequestParser>();
                    services.AddSingleton<ValidatorEngine>();
                    services.AddSingleton<SecureLogger>();
                });
        }
    }
}
