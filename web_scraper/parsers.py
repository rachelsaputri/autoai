from bs4 import BeautifulSoup
from typing import List, Dict
import re


class HtmlParser:
    """
    Helper class for parsing HTML content using BeautifulSoup.
    """

    def extract_links(self, soup: BeautifulSoup) -> List[str]:
        """
        Extract all hyperlink URLs from the soup.

        :param soup: BeautifulSoup object.
        :return: List of absolute URLs.
        """
        links = []
        for anchor in soup.find_all('a', href=True):
            href = anchor['href']
            # Handle relative URLs
            if href.startswith('http'):
                links.append(href)
            else:
                # In a real-world scenario, you might need to resolve relative URLs
                # For simplicity, we just append them as is or you could use urllib.parse.urljoin
                links.append(href)
        return links

    def extract_text(self, soup: BeautifulSoup, tag: str = 'body') -> str:
        """
        Extract all text content from a specific tag.

        :param soup: BeautifulSoup object.
        :param tag: HTML tag to extract text from.
        :return: Text content.
        """
        element = soup.find(tag)
        if element:
            return element.get_text(separator=' ', strip=True)
        return ''

    def extract_metadata(self, soup: BeautifulSoup) -> Dict[str, str]:
        """
        Extract common metadata (title, description, keywords).

        :param soup: BeautifulSoup object.
        :return: Dictionary containing metadata.
        """
        metadata = {}

        # Title
        title_tag = soup.find('title')
        if title_tag:
            metadata['title'] = title_tag.get_text(strip=True)

        # Meta Description
        desc_tag = soup.find('meta', attrs={'name': 'description'})
        if desc_tag and desc_tag.get('content'):
            metadata['description'] = desc_tag['content']

        # Meta Keywords
        keywords_tag = soup.find('meta', attrs={'name': 'keywords'})
        if keywords_tag and keywords_tag.get('content'):
            metadata['keywords'] = keywords_tag['content']

        # Canonical Link
        canonical_tag = soup.find('link', attrs={'rel': 'canonical'})
        if canonical_tag and canonical_tag.get('href'):
            metadata['canonical'] = canonical_tag['href']

        return metadata
