use clap::Parser;
use regex::Regex;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs::File;
use std::io::{self, BufRead, BufReader};

#[derive(Parser)]
#[command(name = "log_analyzer")]
#[command(about = "A high-throughput log file analyzer")]
struct Cli {
    /// Path to the log file
    #[arg(short, long)]
    input: String,

    /// Log format (e.g., common, json, apache)
    #[arg(short, long, default_value = "common")]
    format: String,

    /// Output file path for summary
    #[arg(short, long)]
    output: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
struct LogStats {
    total_lines: u64,
    ip_counts: HashMap<String, u64>,
    status_counts: HashMap<String, u64>,
}

impl LogStats {
    fn new() -> Self {
        LogStats {
            total_lines: 0,
            ip_counts: HashMap::new(),
            status_counts: HashMap::new(),
        }
    }

    fn process_line(&mut self, line: &str) {
        self.total_lines += 1;
        // Simple regex for common log format: IP - - [date] "request" status size
        let re = Regex::new(r#"^(\S+) \S+ \S+ \[.*?\] ".*?" (\d{3})"#).unwrap();
        if let Some(captures) = re.captures(line) {
            let ip = captures.get(1).unwrap().as_str().to_string();
            let status = captures.get(2).unwrap().as_str().to_string();
            *self.ip_counts.entry(ip).or_insert(0) += 1;
            *self.status_counts.entry(status).or_insert(0) += 1;
        }
    }
}

fn main() -> io::Result<()> {
    let cli = Cli::parse();
    let file = File::open(&cli.input)?;
    let reader = BufReader::new(file);
    let mut stats = LogStats::new();

    for line in reader.lines() {
        let line = line?;
        stats.process_line(&line);
    }

    let json = serde_json::to_string_pretty(&stats)?;
    
    match cli.output {
        Some(path) => std::fs::write(path, json)?,
        None => println!("{}", json),
    }

    Ok(())
}
