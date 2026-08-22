proc writeResults(anomalies: [1..*] bool, filepath: string) {
  var openRes = open(filepath, iomode.cwr);
  var writer = openRes.writer();
  
  writer.writeln("{");
  writer.writeln("  \"anomalies_detected\": ", anomalies.size);
  writer.writeln("  \"results\": [");
  
  for i in 1..anomalies.size {
    if anomalies[i] {
      writer.writeln("    { \"record_index\": ", i, ", \"status\": \"anomaly\" },");
    }
  }
  
  writer.writeln("  ]");
  writer.writeln("}");
  
  writer.close();
  openRes.close();
}
