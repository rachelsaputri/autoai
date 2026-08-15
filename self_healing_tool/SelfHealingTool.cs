using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace SelfHealingTool
{
    public class SystemEvent
    {
        public string EventType { get; set; }
        public string Severity { get; set; }
        public string Description { get; set; }
        public DateTime Timestamp { get; set; }
    }

    public class RemediationAction
    {
        public string ActionId { get; set; }
        public string ActionName { get; set; }
        public string Status { get; set; }
    }

    public class ConfigurationSnapshot
    {
        public Dictionary<string, string> Settings { get; set; }
        public DateTime Timestamp { get; set; }
    }

    public class SelfHealingEngine
    {
        private List<ConfigurationSnapshot> history;
        private List<SystemEvent> auditLog;
        private Dictionary<string, string> currentConfig;

        public SelfHealingEngine()
        {
            history = new List<ConfigurationSnapshot>();
            auditLog = new List<SystemEvent>();
            currentConfig = new Dictionary<string, string>();
        }

        public void InitializeConfiguration(Dictionary<string, string> initialConfig)
        {
            currentConfig = new Dictionary<string, string>(initialConfig);
            SnapshotConfiguration("INIT");
            LogEvent("System", "Information", "System initialized with initial configuration.");
        }

        public void TakeSnapshot()
        {
            SnapshotConfiguration("SNAPSHOT");
            LogEvent("System", "Information", "Configuration snapshot taken.");
        }

        private void SnapshotConfiguration(string type)
        {
            var snapshot = new ConfigurationSnapshot
            {
                Settings = new Dictionary<string, string>(currentConfig),
                Timestamp = DateTime.Now
            };
            history.Add(snapshot);
        }

        public List<RemediationAction> DetectAndRemediate()
        {
            var actions = new List<RemediationAction>();
            var driftDetected = false;

            // Simulated drift detection logic
            if (!currentConfig.TryGetValue("Firewall", out string firewallStatus) || firewallStatus != "Enabled")
            {
                driftDetected = true;
                var action = new RemediationAction
                {
                    ActionId = "REM-001",
                    ActionName = "Enable Firewall",
                    Status = "Applied"
                };
                currentConfig["Firewall"] = "Enabled";
                actions.Add(action);
                LogEvent("Remediation", "High", "Firewall was disabled. Auto-remediation applied.");
            }

            if (!currentConfig.TryGetValue("Encryption", out string encryptionStatus) || encryptionStatus != "AES-256")
            {
                driftDetected = true;
                var action = new RemediationAction
                {
                    ActionId = "REM-002",
                    ActionName = "Enforce AES-256 Encryption",
                    Status = "Applied"
                };
                currentConfig["Encryption"] = "AES-256";
                actions.Add(action);
                LogEvent("Remediation", "High", "Encryption was not set to AES-256. Auto-remediation applied.");
            }

            if (driftDetected)
            {
                TakeSnapshot();
            }

            return actions;
        }

        public void LogEvent(string category, string severity, string message)
        {
            var evt = new SystemEvent
            {
                EventType = category,
                Severity = severity,
                Description = message,
                Timestamp = DateTime.Now
            };
            auditLog.Add(evt);
        }

        public void DisplayAuditLog()
        {
            Console.WriteLine("--- Audit Log ---");
            foreach (var evt in auditLog)
            {
                Console.WriteLine($"[{evt.Timestamp}] [{evt.Severity}] {evt.EventType}: {evt.Description}");
            }
            Console.WriteLine("-----------------");
        }

        public void DisplayCurrentConfig()
        {
            Console.WriteLine("--- Current Configuration ---");
            foreach (var kvp in currentConfig)
            {
                Console.WriteLine($"{kvp.Key}: {kvp.Value}");
            }
            Console.WriteLine("-----------------------------");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var engine = new SelfHealingEngine();

            // Simulate initial configuration with some issues
            var initialConfig = new Dictionary<string, string>
            {
                { "Firewall", "Disabled" },
                { "Encryption", "RSA-1024" },
                { "Auth", "Password" }
            };

            Console.WriteLine("Starting Self-Healing Tool...");
            engine.InitializeConfiguration(initialConfig);
            engine.DisplayCurrentConfig();

            Console.WriteLine("\nRunning Drift Detection and Remediation...");
            var actions = engine.DetectAndRemediate();

            if (actions.Any())
            {
                Console.WriteLine($"\n{actions.Count} remediation actions applied:");
                foreach (var action in actions)
                {
                    Console.WriteLine($"- {action.ActionName} ({action.Status})");
                }
            }
            else
            {
                Console.WriteLine("\nNo drift detected. System is compliant.");
            }

            Console.WriteLine("\nUpdated Configuration:");
            engine.DisplayCurrentConfig();

            Console.WriteLine("\nAudit Log:");
            engine.DisplayAuditLog();

            Console.WriteLine("\nSelf-Healing Tool Execution Complete.");
        }
    }
}
