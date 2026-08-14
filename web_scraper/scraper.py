import requests
import time
import logging
from typing import Optional, List, Dict
from bs4 import BeautifulSoup
from .parsers import HtmlParser

logger = logging.getLogger(__name__)


class WebScraper:
    """
    Advanced Web Scraper using requests and BeautifulSoup.
    Handles session management, headers, errors, and delays.
    """

    def __init__(self, user_agent: Optional[str] = None, delay: float = 1.0, max_retries: int = 3):
        """
        Initialize the WebScraper.

        :param user_agent: Optional user agent string.
        :param delay: Delay between requests in seconds.
        :param max_retries: Maximum number of retries for failed requests.
        """
        self.session = requests.Session()
        self.user_agent = user_agent or 'AdvancedWebScraper/1.0'
        self.delay = delay
        self.max_retries = max_retries
        self.parser = HtmlParser()
        self.session.headers.update({'User-Agent': self.user_agent})
        logger.info('WebScraper initialized.')

    def fetch_page(self, url: str) -> Optional[BeautifulSoup]:
        """
        Fetch a webpage and return a BeautifulSoup object.

        :param url: The URL to fetch.
        :return: BeautifulSoup object or None if request failed.
        """
        for i in range(self.max_retries):
            try:
                logger.info(f'Fetching {url} (attempt {i+1})')
                response = self.session.get(url, timeout=10)
                response.raise_for_status()
                time.sleep(self.delay)
                return BeautifulSoup(response.text, 'html.parser')
            except requests.RequestException as e:
                logger.warning(f'Request failed for {url}: {e}')
                if i == self.max_retries - 1:
                    return None
                time.sleep(self.delay * (i + 1))
        return None

    def extract_links(self, soup: BeautifulSoup) -> List[str]:
        """
        Extract all links from a BeautifulSoup object.

        :param soup: BeautifulSoup object.
        :return: List of link URLs.
        """
        return self.parser.extract_links(soup)

    def extract_text(self, soup: BeautifulSoup, tag: str = 'body') -> str:
        """
        Extract text content from a specific tag.

        :param soup: BeautifulSoup object.
        :param tag: HTML tag to extract text from.
        :return: Text content.
        """
        return self.parser.extract_text(soup, tag)

    def extract_metadata(self, soup: BeautifulSoup) -> Dict[str, str]:
        """
        Extract metadata (title, description, keywords) from a BeautifulSoup object.

        :param soup: BeautifulSoup object.
        :return: Dictionary containing metadata.
        """
        return self.parser.extract_metadata(soup)
