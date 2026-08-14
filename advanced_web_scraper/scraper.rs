use reqwest;
use tokio::sync::Mutex;
use std::collections::HashMap;

use crate::parsers::Parser;
use crate::parsers::Node;

pub struct Scraper {
    client: reqwest::Client,
    parser: Parser,
    max_concurrency: usize,
}

struct ScraperState {
    rate_limiter: tokio::time::Instant,
    requests_made: usize,
}

impl Scraper {
    pub fn new(max_concurrency: usize) -> Self {
        let client = reqwest::Client::builder()
            .user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
            .build()
            .expect("Failed to build HTTP client");
        
        Scraper {
            client,
            parser: Parser::new(),
            max_concurrency,
        }
    }

    pub async fn scrape(&self, url: &str, selectors: &[String]) -> Result<Vec<Node>, Box<dyn std::error::Error>> {
        let response = self.client.get(url).send().await?;
        let html = response.text().await?;
        let nodes = self.parser.parse_html(&html, selectors)?;
        Ok(nodes)
    }

    pub async fn scrape_concurrent(&self, urls: Vec<String>, selectors: Vec<String>) -> Result<Vec<Vec<Node>>, Box<dyn std::error::Error>> {
        let mut handles = vec![];
        for url in urls {
            let client = self.client.clone();
            let parser = self.parser.clone();
            handles.push(tokio::spawn(async move {
                let response = client.get(&url).send().await?;
                let html = response.text().await?;
                let nodes = parser.parse_html(&html, &selectors)?;
                Ok::<Vec<Node>, Box<dyn std::error::Error>>(nodes)
            }));
        }

        let mut results = Vec::new();
        for handle in handles {
            match handle.await {
                Ok(Ok(nodes)) => results.push(nodes),
                Ok(Err(e)) => return Err(e),
                Err(e) => return Err(Box::new(e)),
            }
        }
        Ok(results)
    }
}
