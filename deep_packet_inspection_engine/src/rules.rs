use std::path::Path;
use std::fs;
use serde::{Deserialize, Serialize};
use super::parser::ParsedPacket;

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Rule {
    pub name: String,
    pub protocol: String,
    pub conditions: Vec<Condition>,
    pub action: String,
    pub score: u32,
}

#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Condition {
    pub field: String,
    pub op: String,
    pub value: String,
}

#[derive(Debug)]
pub struct RuleSet {
    pub rules: Vec<Rule>,
}

impl RuleSet {
    pub async fn load(path: &Path) -> Result<Self, Box<dyn std::error::Error>> {
        let content = fs::read_to_string(path)?;
        let rules: Vec<Rule> = serde_yaml::from_str(&content)?;
        Ok(Self { rules })
    }

    pub fn evaluate(&self, parsed: &ParsedPacket) -> Result<Vec<String>, Box<dyn std::error::Error>> {
        let mut matched = Vec::new();

        for rule in &self.rules {
            // Check protocol match
            if rule.protocol != "*" && rule.protocol != parsed.protocol {
                continue;
            }

            // Check conditions
            let mut all_conditions_met = true;
            for cond in &rule.conditions {
                if !self.evaluate_condition(cond, parsed) {
                    all_conditions_met = false;
                    break;
                }
            }

            if all_conditions_met {
                matched.push(rule.name.clone());
            }
        }

        Ok(matched)
    }

    fn evaluate_condition(&self, cond: &Condition, parsed: &ParsedPacket) -> bool {
        match cond.field.as_str() {
            "header.type" => {
                if let Some(type_bytes) = parsed.header.get("type") {
                    if type_bytes.is_empty() { return false; }
                    let type_val = type_bytes[0] as u8;
                    match cond.op.as_str() {
                        "eq" => {
                            if let Ok(val) = u8::from_str_radix(&cond.value, 16) {
                                return type_val == val;
                            }
                        }
                        _ => {}
                    }
                }
            }
            "payload" => {
                if let Some(signature) = parse_hex_string(&cond.value) {
                    match cond.op.as_str() {
                        "contains" => return parsed.payload.contains(&signature),
                        _ => {}
                    }
                }
            }
            _ => {}
        }
        false
    }
}

fn parse_hex_string(s: &str) -> Option<Vec<u8>> {
    if s.len() % 2 != 0 {
        return None;
    }
    let mut result = Vec::new();
    for i in (0..s.len()).step_by(2) {
        if let Ok(byte) = u8::from_str_radix(&s[i..i+2], 16) {
            result.push(byte);
        } else {
            return None;
        }
    }
    Some(result)
}
