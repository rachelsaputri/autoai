use scraper::{Html, Selector};
use std::sync::Arc;

#[derive(Debug, Clone)]
pub struct Node {
    pub text: String,
    pub tag: String,
    pub attributes: std::collections::HashMap<String, String>,
}

pub struct Parser;

impl Parser {
    pub fn new() -> Self {
        Parser
    }

    pub fn parse_html(&self, html: &str, selectors: &[String]) -> Result<Vec<Node>, String> {
        let document = Html::parse_document(html);
        let mut results = Vec::new();
        for sel in selectors {
            let selector = Selector::parse(sel)
                .map_err(|e| format!("Invalid selector '{}': {}", sel, e))?;
            for element in document.select(&selector) {
                let tag = element.value().name().unwrap_or("unknown").to_string();
                let text = element.text().map(|t| t.collect::<String>()).unwrap_or_default();
                let mut attributes = std::collections::HashMap::new();
                for attr in element.attrs() {
                    attributes.insert(attr.0.to_string(), attr.1.to_string());
                }
                results.push(Node {
                    tag,
                    text,
                    attributes,
                });
            }
        }
        Ok(results)
    }
}
