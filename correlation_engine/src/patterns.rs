use regex::Regex;
use std::collections::HashMap;
use log::info;

pub struct PatternRegistry {
    patterns: HashMap<String, (Regex, f64)>,
}

impl PatternRegistry {
    pub fn new() -> Self {
        let mut registry = PatternRegistry {
            patterns: HashMap::new(),
        };
        registry.register_default_patterns();
        info!("Pattern registry initialized with {} patterns", registry.patterns.len());
        registry
    }

    fn register_default_patterns(&mut self) {
        // SQL Injection
        self.register("sql_injection", r"(?i)(\b(union|select|insert|update|delete|drop|alter|create)\b.*\b(from|into|table|database)\b)", 0.9);
        // XSS
        self.register("xss", r"(?i)(<script[^>]*>|javascript:|onerror=|onload=)", 0.85);
        // Brute Force Indicators
        self.register("brute_force_indicator", r"failed.*(login|auth|password).{0,20}(attempt|error|fail)", 0.7);
        // Privilege Escalation
        self.register("priv_esc", r"(?i)(sudo|su |chmod.*777|setuid|chmod u\+s)", 0.8);
    }

    pub fn register(&mut self, name: &str, regex: &str, weight: f64) {
        match Regex::new(regex) {
            Ok(re) => {
                self.patterns.insert(name.to_string(), (re, weight));
            }
            Err(e) => {
                log::warn!("Failed to compile pattern {}: {}", name, e);
            }
        }
    }

    pub fn matches(&self, message: &str) -> Vec<(String, f64)> {
        self.patterns.iter()
            .filter_map(|(name, (re, weight))| {
                if re.is_match(message) {
                    Some((name.clone(), *weight))
                } else {
                    None
                }
            })
            .collect()
    }

    pub fn optimize(&mut self) {
        // In a real implementation, this would merge overlapping regexes or compile them
        // into a single Aho-Corasick automaton for O(N) matching
        info!("Optimizing pattern registry...");
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sql_injection_pattern() {
        let registry = PatternRegistry::new();
        let matches = registry.matches("SELECT * FROM users WHERE id=1 OR 1=1");
        assert!(matches.iter().any(|(name, _)| name == "sql_injection"));
    }
}
