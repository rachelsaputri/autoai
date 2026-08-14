# Advanced Web Scraper

This module provides a robust and easy-to-use web scraping utility built with Python, `requests`, and `BeautifulSoup`.

## Features

- **Session Management**: Reuses HTTP connections for efficiency.
- **Error Handling**: Retries failed requests with exponential backoff.
- **User Agent Customization**: Prevents basic bot blocking.
- **HTML Parsing**: Extracts links, text, and metadata efficiently.
- **Logging**: Integrated logging for debugging and monitoring.

## Installation

Ensure you have the required dependencies:

```bash
pip install requests beautifulsoup4
```

## Usage

```python
from web_scraper import WebScraper

# Initialize the scraper
scraper = WebScraper(
    user_agent='MyCustomBot/1.0',
    delay=2.0,
    max_retries=3
)

# Fetch a page
url = 'https://example.com'
soup = scraper.fetch_page(url)

if soup:
    # Extract links
    links = scraper.extract_links(soup)
    print(f'Found {len(links)} links.')

    # Extract metadata
    metadata = scraper.extract_metadata(soup)
    print(f'Title: {metadata.get("title")}')
    print(f'Description: {metadata.get("description")}')

    # Extract text content
    text = scraper.extract_text(soup, tag='article')
    print(f'Article Text Length: {len(text)}')
else:
    print('Failed to fetch page.')
```

## Structure

- `scraper.py`: Contains the main `WebScraper` class for fetching and coordinating parsing.
- `parsers.py`: Contains the `HtmlParser` class for extracting specific data from HTML.
- `__init__.py`: Module initialization and public API exposure.
- `README.md`: This documentation file.

## Contributing

Feel free to submit issues or pull requests to improve the scraper.

## License

MIT License
