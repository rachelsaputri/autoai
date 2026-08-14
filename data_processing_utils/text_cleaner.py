import re
from typing import List, Union

class TextCleaner:
    """Provides utilities for cleaning and normalizing text data."""

    def __init__(self, text: Union[str, List[str]]):
        self.text = text

    def remove_extra_whitespace(self) -> Union[str, List[str]]:
        """Removes leading/trailing whitespace and collapses multiple spaces."""
        if isinstance(self.text, str):
            return re.sub(r'\s+', ' ', self.text).strip()
        elif isinstance(self.text, list):
            return [re.sub(r'\s+', ' ', t).strip() for t in self.text]
        else:
            raise TypeError("Input must be a string or a list of strings.")

    def remove_special_characters(self) -> Union[str, List[str]]:
        """Removes all characters except alphanumeric, spaces, and basic punctuation."""
        pattern = r'[^\w\s\.,!?;\-\'\"]'
        if isinstance(self.text, str):
            return re.sub(pattern, '', self.text)
        elif isinstance(self.text, list):
            return [re.sub(pattern, '', t) for t in self.text]
        else:
            raise TypeError("Input must be a string or a list of strings.")

    def lowercase(self) -> Union[str, List[str]]:
        """Converts text to lowercase."""
        if isinstance(self.text, str):
            return self.text.lower()
        elif isinstance(self.text, list):
            return [t.lower() for t in self.text]
        else:
            raise TypeError("Input must be a string or a list of strings.")

    def clean(self, remove_special: bool = False, lowercase: bool = False) -> Union[str, List[str]]:
        """Applies a standard cleaning pipeline: whitespace removal, and optionally lowercasing/special char removal."""
        result = self.remove_extra_whitespace()
        if lowercase:
            result = self.lowercase()
        if remove_special:
            result = self.remove_special_characters()
        return result
