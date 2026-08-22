record Baseline {
  var meanSeverity: real;
  var stddevSeverity: real;
  var meanPayloadSize: real;
  var stddevPayloadSize: real;
  var totalRecords: int;
}

proc computeBaselines(entries: [] LogEntry): Baseline {
  var totalSeverity: real = 0.0;
  var totalPayload: real = 0.0;
  var count: int = 0;
  
  forall i in 1..entries.size {
    if isValid(entries[i]) {
      totalSeverity += entries[i].severity;
      totalPayload += entries[i].payloadSize;
      count += 1;
    }
  }
  
  if count == 0 then
    return Baseline(0.0, 1.0, 0.0, 1.0, 0);
  end if;
  
  var meanS = totalSeverity / count;
  var meanP = totalPayload / count;
  
  var sumSqS: real = 0.0;
  var sumSqP: real = 0.0;
  
  forall i in 1..entries.size {
    if isValid(entries[i]) {
      var dS = entries[i].severity - meanS;
      var dP = entries[i].payloadSize - meanP;
      sumSqS += dS * dS;
      sumSqP += dP * dP;
    }
  }
  
  return Baseline(meanS, sqrt(sumSqS/count), meanP, sqrt(sumSqP/count), count);
}

proc detectAnomalies(entries: [] LogEntry, base: Baseline, thresh: real): [1..entries.size] bool {
  var anomalies: [1..entries.size] bool;
  
  forall i in 1..entries.size {
    anomalies[i] = false;
    if isValid(entries[i]) {
      var zS = if base.stddevSeverity > 0 then abs(entries[i].severity - base.meanSeverity) / base.stddevSeverity else 0.0;
      var zP = if base.stddevPayloadSize > 0 then abs(entries[i].payloadSize - base.meanPayloadSize) / base.stddevPayloadSize else 0.0;
      anomalies[i] = (zS > thresh || zP > thresh);
    }
  }
  
  return anomalies;
}
