# Advanced Web Scraper

A high-performance web scraping library implemented in Rust. This library leverages Rust's memory safety and concurrency features to scrape web pages efficiently.

## Features

- High-performance HTML parsing
- Concurrent scraping support
- Async/await support
- Memory safety

## Usage

Add this to your `Cargo.toml`:

```toml
[dependencies]
advanced_web_scraper = { path = "../advanced_web_scraper" }
```

Example usage:

```rust
use advanced_web_scraper::Scraper;

#[tokio::main]
async fn main() {
    let scraper = Scraper::new(10);
    let results = scraper.scrape("https://example.com", &["h1".to_string()]).await;
    println!("Results: {:?}", results);
}
```
