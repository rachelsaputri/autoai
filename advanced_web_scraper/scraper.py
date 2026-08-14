import asyncio
import aiohttp
from bs4 import BeautifulSoup
from .parsers import ContentParser

class AdvancedScraper:
    def __init__(self, timeout=30):
        self.timeout = timeout
        self.session = None
        self.parser = ContentParser()

    async def __aenter__(self):
        self.session = aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=self.timeout))
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        if self.session:
            await self.session.close()

    async def scrape(self, url, headers=None):
        if not self.session:
            await self.__aenter__()
        
        try:
            async with self.session.get(url, headers=headers) as response:
                html = await response.text()
                return self.parser.parse(html, url)
        except Exception as e:
            raise e
