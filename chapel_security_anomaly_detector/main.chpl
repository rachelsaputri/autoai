use IO;
use OptionParser;
use Ingestor;
use Analyzer;
use Reporter;
use Config;

config const inputPath: string = "./data/sample_logs.csv";
config const outputPath: string = "./results/alerts.json";
config const threshold: real = 3.0;
config const workerCount: int = 0;

proc main() {
  var cfg: Config;
  try {
    cfg = loadConfig(inputPath);
  } catch e: IOError {
    writeln("Failed to load config/input: ", e.msg);
    return;
  }

  if workerCount > 0 {
    setNumTaskPools(workerCount);
  }

  const logData = parseLogs(cfg);
  if logData.isEmpty then
    writeln("No log entries found.");
    return;
  end if;

  const baseline = computeBaselines(logData);
  const anomalies = detectAnomalies(logData, baseline, threshold);
  
  try {
    writeResults(anomalies, outputPath);
    writeln("Detection complete. Found ", anomalies.size, " anomalies. Output written to ", outputPath);
  } catch e: IOError {
    writeln("Failed to write results: ", e.msg);
  }
}
