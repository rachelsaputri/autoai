use IO;
use Regex;
use Strings;
use Sort;
use Optionals;
use Time;

// Enum for diagnostic categories
enum DiagnosticCategory {
  CPU,
  MEMORY,
  DISK,
  NETWORK,
  SECURITY,
  CONFIGURATION,
  SYSTEM_HEALTH,
  UNKNOWN
}

// Struct to represent a diagnostic check result
record DiagnosticResult {
  var category: DiagnosticCategory;
  var testName: string;
  var passed: bool;
  var message: string;
  var severity: int;
  var timestamp: string;
}

// Class for the diagnostic engine
class DiagnosticEngine {
  var results: [1..1000] DiagnosticResult;
  var resultCount: int;
  var verbose: bool;
  var interactiveMode: bool;

  proc init(verbose: bool = false, interactiveMode: bool = true) {
    this.verbose = verbose;
    this.interactiveMode = interactiveMode;
    this.resultCount = 0;
  }

  proc addResult(category: DiagnosticCategory, testName: string, passed: bool, message: string, severity: int) {
    if resultCount < results.domain.upper {
      results[resultCount+1] = DiagnosticResult(category, testName, passed, message, severity, Time.timeNow());
      resultCount += 1;
    }
  }

  proc runCPUDiagnostics(): void {
    writeln("Running CPU diagnostics...");
    try {
      var cpuCount: int;
      var cpuLoad: real;
      // Simulate CPU check
      cpuCount = 4;
      cpuLoad = 0.25;
      
      addResult(DiagnosticCategory.CPU, "CPU Core Count", true, "Found " + cpuCount:string + " cores", 1);
      addResult(DiagnosticCategory.CPU, "CPU Load", cpuLoad < 0.8, "CPU load is " + cpuLoad:string + "%", 2);
      addResult(DiagnosticCategory.CPU, "CPU Temperature", true, "Temperature within normal range", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.CPU, "CPU Diagnostics", false, "Error during CPU diagnostics: " + e:string, 3);
    }
  }

  proc runMemoryDiagnostics(): void {
    writeln("Running memory diagnostics...");
    try {
      var totalMemory: real;
      var usedMemory: real;
      var memoryLoad: real;
      
      // Simulate memory check
      totalMemory = 16.0;
      usedMemory = 8.0;
      memoryLoad = usedMemory / totalMemory;
      
      addResult(DiagnosticCategory.MEMORY, "Memory Capacity", true, "Total memory: " + totalMemory:string + "GB", 1);
      addResult(DiagnosticCategory.MEMORY, "Memory Utilization", memoryLoad < 0.9, "Memory usage: " + (memoryLoad*100):string + "%", 2);
      addResult(DiagnosticCategory.MEMORY, "Swap Space", true, "Swap space is available", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.MEMORY, "Memory Diagnostics", false, "Error during memory diagnostics: " + e:string, 3);
    }
  }

  proc runDiskDiagnostics(): void {
    writeln("Running disk diagnostics...");
    try {
      var diskSpace: real;
      var diskUsage: real;
      
      // Simulate disk check
      diskSpace = 500.0;
      diskUsage = 250.0;
      
      addResult(DiagnosticCategory.DISK, "Disk Space", diskSpace > 50, "Available disk space: " + (diskSpace - diskUsage):string + "GB", 1);
      addResult(DiagnosticCategory.DISK, "Disk Usage", diskUsage/diskSpace < 0.85, "Disk usage: " + (diskUsage/diskSpace*100):string + "%", 2);
      addResult(DiagnosticCategory.DISK, "File System", true, "File system is healthy", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.DISK, "Disk Diagnostics", false, "Error during disk diagnostics: " + e:string, 3);
    }
  }

  proc runNetworkDiagnostics(): void {
    writeln("Running network diagnostics...");
    try {
      var latency: real;
      var packetLoss: real;
      
      // Simulate network check
      latency = 15.0;  // ms
      packetLoss = 0.0;  // %
      
      addResult(DiagnosticCategory.NETWORK, "Network Latency", latency < 100, "Latency: " + latency:string + "ms", 1);
      addResult(DiagnosticCategory.NETWORK, "Packet Loss", packetLoss < 1.0, "Packet loss: " + packetLoss:string + "%", 2);
      addResult(DiagnosticCategory.NETWORK, "Connectivity", true, "Network connectivity is stable", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.NETWORK, "Network Diagnostics", false, "Error during network diagnostics: " + e:string, 3);
    }
  }

  proc runSecurityDiagnostics(): void {
    writeln("Running security diagnostics...");
    try {
      var firewallActive: bool;
      var antivirusActive: bool;
      var openPorts: int;
      
      // Simulate security check
      firewallActive = true;
      antivirusActive = true;
      openPorts = 3;
      
      addResult(DiagnosticCategory.SECURITY, "Firewall Status", firewallActive, "Firewall is active", 1);
      addResult(DiagnosticCategory.SECURITY, "Antivirus Status", antivirusActive, "Antivirus is active", 1);
      addResult(DiagnosticCategory.SECURITY, "Open Ports", openPorts < 10, "Number of open ports: " + openPorts:string, 2);
      addResult(DiagnosticCategory.SECURITY, "Security Patches", true, "System is up to date with security patches", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.SECURITY, "Security Diagnostics", false, "Error during security diagnostics: " + e:string, 3);
    }
  }

  proc runConfigDiagnostics(): void {
    writeln("Running configuration diagnostics...");
    try {
      var configValid: bool;
      var deprecatedSettings: int;
      
      // Simulate configuration check
      configValid = true;
      deprecatedSettings = 0;
      
      addResult(DiagnosticCategory.CONFIGURATION, "Configuration Syntax", configValid, "Configuration syntax is valid", 1);
      addResult(DiagnosticCategory.CONFIGURATION, "Deprecated Settings", deprecatedSettings == 0, "No deprecated settings found", 1);
      addResult(DiagnosticCategory.CONFIGURATION, "Environment Variables", true, "Environment variables are properly configured", 1);
    } catch e: Error {
      addResult(DiagnosticCategory.CONFIGURATION, "Configuration Diagnostics", false, "Error during configuration diagnostics: " + e:string, 3);
    }
  }

  proc runSystemHealthCheck(): void {
    writeln("Running system health check...");
    try {
      var uptime: real;
      var loadAverage: real;
      var processCount: int;
      
      // Simulate system health check
      uptime = 86400.0;  // 24 hours
      loadAverage = 1.5;
      processCount = 150;
      
      addResult(DiagnosticCategory.SYSTEM_HEALTH, "System Uptime", uptime > 3600, "System uptime: " + (uptime/3600):string + " hours", 1);
      addResult(DiagnosticCategory.SYSTEM_HEALTH, "Load Average", loadAverage < 4.0, "Load average: " + loadAverage:string, 2);
      addResult(DiagnosticCategory.SYSTEM_HEALTH, "Process Count", processCount < 300, "Number of processes: " + processCount:string, 1);
    } catch e: Error {
      addResult(DiagnosticCategory.SYSTEM_HEALTH, "System Health Check", false, "Error during system health check: " + e:string, 3);
    }
  }

  proc runAllDiagnostics(): void {
    writeln("Starting comprehensive system diagnostics...");
    writeln("========================================");
    
    runCPUDiagnostics();
    runMemoryDiagnostics();
    runDiskDiagnostics();
    runNetworkDiagnostics();
    runSecurityDiagnostics();
    runConfigDiagnostics();
    runSystemHealthCheck();
    
    writeln("========================================");
    writeln("Diagnostics complete. Results saved.");
    writeln("Total checks performed: " + resultCount:string);
  }

  proc printResults(): void {
    writeln("\nDiagnostic Results:");
    writeln("===================");
    
    for i in 1..resultCount {
      var r = results[i];
      var status: string;
      if r.passed then status = "PASS"; else status = "FAIL";
      
      var severityStr: string;
      select r.severity {
        when 1 { severityStr = "INFO"; }
        when 2 { severityStr = "WARNING"; }
        when 3 { severityStr = "CRITICAL"; }
        otherwise { severityStr = "UNKNOWN"; }
      }
      
      writeln("[" + status + "] [" + severityStr + "] " + r.testName);
      writeln("    Category: " + r.category:string);
      writeln("    Message: " + r.message);
      writeln();
    }
  }

  proc getSummary(): (int, int, int) {
    var passed: int = 0;
    var failed: int = 0;
    var warnings: int = 0;
    
    for i in 1..resultCount {
      var r = results[i];
      if r.passed then passed += 1; else failed += 1;
      if r.severity == 2 then warnings += 1;
    }
    
    return (passed, failed, warnings);
  }
}

// Interactive menu for the diagnostic tool
proc displayMenu(): int {
  writeln("\n=== Interactive Diagnostic Tool ===");
  writeln("1. Run All Diagnostics");
  writeln("2. Run CPU Diagnostics");
  writeln("3. Run Memory Diagnostics");
  writeln("4. Run Disk Diagnostics");
  writeln("5. Run Network Diagnostics");
  writeln("6. Run Security Diagnostics");
  writeln("7. Run Configuration Diagnostics");
  writeln("8. Run System Health Check");
  writeln("9. View Results");
  writeln("10. View Summary");
  writeln("11. Exit");
  write("Enter your choice: ");
  
  var choice: int;
  try {
    choice = readln().chomp().getInt();
  } catch e: Error {
    writeln("Invalid input. Please enter a number between 1 and 11.");
    return 0;
  }
  
  if choice < 1 || choice > 11 {
    writeln("Invalid choice. Please enter a number between 1 and 11.");
    return 0;
  }
  
  return choice;
}

// Main procedure
proc main() {
  var verbose: bool = false;
  var interactiveMode: bool = true;
  
  // Parse command line arguments
  var args: [1..$CmdLineArgs] string = CmdLineArgs;
  for arg in args {
    if arg == "--verbose" then verbose = true;
    if arg == "--non-interactive" then interactiveMode = false;
  }
  
  var engine = new DiagnosticEngine(verbose, interactiveMode);
  var choice: int;
  
  if interactiveMode then {
    do {
      choice = displayMenu();
      
      if choice == 0 then continue;
      
      select choice {
        when 1 { engine.runAllDiagnostics(); }
        when 2 { engine.runCPUDiagnostics(); }
        when 3 { engine.runMemoryDiagnostics(); }
        when 4 { engine.runDiskDiagnostics(); }
        when 5 { engine.runNetworkDiagnostics(); }
        when 6 { engine.runSecurityDiagnostics(); }
        when 7 { engine.runConfigDiagnostics(); }
        when 8 { engine.runSystemHealthCheck(); }
        when 9 { engine.printResults(); }
        when 10 { 
          var (passed, failed, warnings) = engine.getSummary();
          writeln("\nSummary:");
          writeln("========");
          writeln("Passed: " + passed:string);
          writeln("Failed: " + failed:string);
          writeln("Warnings: " + warnings:string);
          writeln("Total Checks: " + (passed+failed):string);
        }
        when 11 { writeln("Exiting diagnostic tool..."); }
        otherwise { writeln("Invalid choice. Please try again."); }
      }
    } while choice != 11;
  } else {
    // Non-interactive mode: run all diagnostics and print results
    engine.runAllDiagnostics();
    engine.printResults();
    
    var (passed, failed, warnings) = engine.getSummary();
    writeln("\nSummary:");
    writeln("========");
    writeln("Passed: " + passed:string);
    writeln("Failed: " + failed:string);
    writeln("Warnings: " + warnings:string);
    writeln("Total Checks: " + (passed+failed):string);
  }
}
