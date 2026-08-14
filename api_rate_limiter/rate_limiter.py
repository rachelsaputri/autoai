import time
import logging
from functools import wraps
from typing import Dict, Optional, Callable

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class RateLimitStrategy:
    """Base class for rate limit strategies."""
    def calculate_delay(self, remaining: int, limit: int, current_usage: int) -> float:
        raise NotImplementedError

class ExponentialBackoff(RateLimitStrategy):
    """Exponential backoff strategy."""
    def __init__(self, base_delay: float = 1.0, max_delay: float = 60.0, multiplier: float = 2.0):
        self.base_delay = base_delay
        self.max_delay = max_delay
        self.multiplier = multiplier

    def calculate_delay(self, remaining: int, limit: int, current_usage: int) -> float:
        # If we are close to the limit, increase delay exponentially
        ratio = current_usage / limit
        if ratio >= 0.9: # 90% used
            delay = self.base_delay * (self.multiplier ** (int(ratio * 10) - 9))
            return min(delay, self.max_delay)
        return 0.0

class APIClientRateLimiter:
    """Manages rate limiting for API clients."""
    def __init__(self, max_requests: int, period: int = 60, strategy: RateLimitStrategy = ExponentialBackoff()):
        self.max_requests = max_requests
        self.period = period
        self.strategy = strategy
        self.request_log: Dict[str, list] = {} # endpoint -> [timestamps]
        self.headers_cache: Dict[str, Dict] = {} # endpoint -> headers

    def _clean_log(self, endpoint: str, now: float):
        """Remove timestamps older than the current period."""
        if endpoint in self.request_log:
            self.request_log[endpoint] = [
                ts for ts in self.request_log[endpoint] if ts > now - self.period
            ]

    def get_remaining_requests(self, endpoint: str) -> int:
        """Get the number of remaining requests allowed in the current period."""
        now = time.time()
        self._clean_log(endpoint, now)
        if endpoint not in self.request_log:
            self.request_log[endpoint] = []
        
        current_usage = len(self.request_log[endpoint])
        remaining = self.max_requests - current_usage
        return max(0, remaining)

    def check_and_wait(self, endpoint: str) -> None:
        """Check rate limit and wait if necessary."""
        remaining = self.get_remaining_requests(endpoint)
        if remaining <= 0:
            logger.warning(f"Rate limit reached for endpoint: {endpoint}. Waiting...")
            delay = self.strategy.calculate_delay(remaining, self.max_requests, self.max_requests)
            time.sleep(delay)
            logger.info(f"Waited {delay}s. Resuming requests for {endpoint}.")
        else:
            logger.debug(f"Requests remaining: {remaining} for endpoint {endpoint}")

    def record_request(self, endpoint: str) -> None:
        """Record a request to the endpoint."""
        now = time.time()
        self.request_log[endpoint] = self.request_log.get(endpoint, [])
        self.request_log[endpoint].append(now)

    def update_from_headers(self, endpoint: str, headers: Dict[str, str]) -> None:
        """Update internal state based on API response headers."""
        # Example: parsing standard headers
        # X-RateLimit-Remaining: 10
        # Retry-After: 120
        self.headers_cache[endpoint] = headers
        logger.info(f"Updated headers for {endpoint}: {headers}")

    def handle_response(self, response) -> object:
        """Decorator to handle rate limit responses automatically."""
        def decorator(func: Callable) -> Callable:
            @wraps(func)
            def wrapper(*args, **kwargs):
                endpoint = kwargs.get('endpoint', 'default')
                self.check_and_wait(endpoint)
                try:
                    result = func(*args, **kwargs)
                    # Update headers if response has them
                    if hasattr(result, 'headers'):
                        self.update_from_headers(endpoint, result.headers)
                    self.record_request(endpoint)
                    return result
                except Exception as e:
                    logger.error(f"Error during API call: {e}")
                    raise
            return wrapper
        return decorator

# Example Usage:
if __name__ == "__main__":
    limiter = APIClientRateLimiter(max_requests=5, period=10)

    @limiter.handle_response
    def simulate_api_call(endpoint: str):
        logger.info(f"Making request to {endpoint}")
        time.sleep(1) # Simulate network delay
        return {"status": 200, "data": "success"}

    # Simulate multiple calls
    for i in range(7):
        simulate_api_call(endpoint="users")
