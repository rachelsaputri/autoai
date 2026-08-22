record LogEntry {
  var timestamp: int;
  var sourceIP: string;
  var eventType: string;
  var severity: int;
  var payloadSize: int;
  var isMalformed: bool;
}

proc parseLogs(cfg: Config): [] LogEntry {
  var entries: [1..cfg.recordCount] LogEntry;
  
  coforall loc in Locales do
    on loc {
      var startIdx = (cfg.recordCount * loc.id) / NumLocalities + 1;
      var endIdx = (cfg.recordCount * (loc.id + 1)) / NumLocalities;
      
      if startIdx <= endIdx {
        for i in startIdx..endIdx {
          // Simulating parallel file chunk parsing logic
          // In a real implementation, this would use Chapel's distributed file I/O
          var entry: LogEntry = default LogEntry;
          entry.isMalformed = false;
          entries[i] = entry;
        }
      }
    }
  
  return entries;
}

proc isValid(entry: LogEntry): bool {
  return !entry.isMalformed && entry.severity >= 0 && entry.payloadSize >= 0;
}
