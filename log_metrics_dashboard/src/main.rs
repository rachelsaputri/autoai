use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::io::{self, BufRead};
use std::time::Instant;

/// Represents a single log entry after parsing
#[derive(Debug, Deserialize, Serialize)]
pub struct LogEntry {
    pub timestamp: String,
    pub level: String,
    pub status_code: Option<u16>,
    pub duration_ms: Option<f64>,
    pub message: String,
}

/// Aggregated metrics for the dashboard
#[derive(Debug, Serialize)]
pub struct DashboardMetrics {
    pub total_requests: u64,
    pub error_rate: f64,
    pub avg_latency_ms: f64,
    pub p99_latency_ms: f64,
    pub status_codes: HashMap<u16, u64>,
}

impl DashboardMetrics {
    pub fn new() -> Self {
        DashboardMetrics {
            total_requests: 0,
            error_rate: 0.0,
            avg_latency_ms: 0.0,
            p99_latency_ms: 0.0,
            status_codes: HashMap::new(),
        }
    }
}

/// Aggregator struct to collect metrics
pub struct MetricsAggregator {
    pub total_requests: u64,
    pub error_count: u64,
    pub latencies: Vec<f64>,
    pub status_codes: HashMap<u16, u64>,
}

impl MetricsAggregator {
    pub fn new() -> Self {
        MetricsAggregator {
            total_requests: 0,
            error_count: 0,
            latencies: Vec::new(),
            status_codes: HashMap::new(),
        }
    }

    pub fn process_entry(&mut self, entry: &LogEntry) {
        self.total_requests += 1;

        // Count errors (5xx status codes)
        if let Some(code) = entry.status_code {
            *self.status_codes.entry(code).or_insert(0) += 1;
            if code >= 500 {
                self.error_count += 1;
            }
        }

        // Collect latency
        if let Some(duration) = entry.duration_ms {
            self.latencies.push(duration);
        }
    }

    pub fn generate_dashboard_metrics(&self) -> DashboardMetrics {
        let avg_latency = if self.latencies.is_empty() {
            0.0
        } else {
            let sum: f64 = self.latencies.iter().sum();
            sum / self.latencies.len() as f64
        };

        let p99_latency = if self.latencies.is_empty() {
            0.0
        } else {
            let mut sorted = self.latencies.clone();
            sorted.sort_by(f64::total_cmp);
            let p99_index = ((sorted.len() as f64) * 0.99).ceil() as usize - 1;
            sorted[p99_index.min(sorted.len() - 1)]
        };

        let error_rate = if self.total_requests > 0 {
            self.error_count as f64 / self.total_requests as f64
        } else {
            0.0
        };

        DashboardMetrics {
            total_requests: self.total_requests,
            error_rate,
            avg_latency_ms: avg_latency,
            p99_latency_ms: p99_latency,
            status_codes: self.status_codes.clone(),
        }
    }
}

pub fn run_aggregator() -> Result<(), Box<dyn std::error::Error>> {
    let start = Instant::now();
    let mut aggregator = MetricsAggregator::new();

    let stdin = io::stdin();
    let mut has_input = false;

    for line in stdin.lock().lines() {
        let line = line?;
        if line.is_empty() {
            continue;
        }
        has_input = true;
        
        // Try to deserialize JSON log entry
        if let Ok(entry) = serde_json::from_str::<LogEntry>(&line) {
            aggregator.process_entry(&entry);
        } else {
            // Fallback or log parsing error
            eprintln!("Failed to parse line: {}", line);
        }
    }

    if !has_input {
        eprintln!("No input provided.");
        std::process::exit(1);
    }

    let metrics = aggregator.generate_dashboard_metrics();
    
    // Output JSON metrics
    let json_output = serde_json::to_string_pretty(&metrics)?;
    println!("{}", json_output);

    eprintln!("Aggregation complete in {:?}", start.elapsed());
    Ok(())
}
