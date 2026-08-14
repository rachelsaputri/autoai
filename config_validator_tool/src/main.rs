use clap::Parser;
use serde::{Deserialize, Serialize};
use std::fs;
use std::path::Path;
use std::process;
use std::io;

#[derive(Parser)]
#[command(name = "config_validator_tool")]
#[command(about = "Validates configuration files for Rust-based services")]
struct Cli {
    /// Path to the configuration file
    #[arg(short, long)]
    config_file: String,

    /// Format of the configuration file (toml or json)
    #[arg(short, long, default_value = "toml")]
    format: ConfigFormat,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
struct ConfigSchema {
    service_name: String,
    log_level: String,
    max_connections: u32,
    enabled: bool,
}

impl ConfigSchema {
    fn validate(&self) -> Result<(), Vec<String>> {
        let mut errors = Vec::new();

        if self.service_name.is_empty() {
            errors.push("service_name cannot be empty".to_string());
        }

        if !matches!(
            self.log_level.as_str(),
            "debug" | "info" | "warn" | "error"
        ) {
            errors.push("log_level must be one of: debug, info, warn, error".to_string());
        }

        if self.max_connections == 0 {
            errors.push("max_connections must be greater than zero".to_string());
        }

        if errors.is_empty() {
            Ok(())
        } else {
            Err(errors)
        }
    }
}

#[derive(Debug, Clone)]
enum ConfigFormat {
    Toml,
    Json,
}

impl std::str::FromStr for ConfigFormat {
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s.to_lowercase().as_str() {
            "toml" => Ok(ConfigFormat::Toml),
            "json" => Ok(ConfigFormat::Json),
            _ => Err(format!("Unsupported config format: {}", s)),
        }
    }
}

fn read_config_file(path: &str) -> Result<String, String> {
    if !Path::new(path).exists() {
        return Err(format!("Config file not found: {}", path));
    }
    fs::read_to_string(path).map_err(|e| format!("Failed to read file: {}", e))
}

fn parse_toml_config(content: &str) -> Result<ConfigSchema, String> {
    let parsed: ConfigSchema = toml::from_str(content).map_err(|e| format!("TOML parse error: {}", e))?;
    Ok(parsed)
}

fn parse_json_config(content: &str) -> Result<ConfigSchema, String> {
    let parsed: ConfigSchema = serde_json::from_str(content).map_err(|e| format!("JSON parse error: {}", e))?;
    Ok(parsed)
}

fn main() {
    env_logger::init();

    let cli = Cli::parse();

    let content = match read_config_file(&cli.config_file) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Error: {}", e);
            process::exit(1);
        }
    };

    let config_schema = match cli.format {
        ConfigFormat::Toml => parse_toml_config(&content),
        ConfigFormat::Json => parse_json_config(&content),
    };

    let schema = match config_schema {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error: {}", e);
            process::exit(1);
        }
    };

    match schema.validate() {
        Ok(()) => {
            println!("Configuration is valid.");
            process::exit(0);
        }
        Err(errors) => {
            eprintln!("Configuration validation failed:");
            for error in errors {
                eprintln!("  - {}", error);
            }
            process::exit(1);
        }
    }
}
