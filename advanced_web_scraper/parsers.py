import re
from bs4 import BeautifulSoup

class ContentParser:
    def __init__(self):
        self.parsers = {
            'text': self._extract_text,
            'links': self._extract_links
        }

    def parse(self, html, base_url):
        soup = BeautifulSoup(html, 'html.parser')
        data = {
            'title': soup.title.string if soup.title else None,
            'text': self._extract_text(soup),
            'links': self._extract_links(soup, base_url)
        }
        return data

    def _extract_text(self, soup):
        return ' '.join(soup.stripped_strings)

    def _extract_links(self, soup, base_url):
        links = []
        for a_tag in soup.find_all('a', href=True):
            links.append({
                'text': a_tag.get_text(strip=True),
                'href': a_tag['href']
            })
        return links
