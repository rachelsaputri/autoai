# API Rate Limiter

This module implements a high-concurrency sliding-window rate limiter in Go.

## Features
- **Sliding Window Algorithm**: Provides accurate rate limiting based on time windows.
- **Concurrency Safe**: Utilizes Go's `sync.Mutex` to ensure thread-safe token management.
- **Configurable**: Allows setting maximum tokens and refill intervals.
- **High Performance**: Leverages Go's lightweight goroutines for handling concurrent requests efficiently.

## Usage

Import the `ratelimiter` package and initialize a rate limiter with your desired configuration.

```go
package main

import (
"fmt"
"github.com/yourusername/repo/api_rate_limiter/ratelimiter"
"time"
)

func main() {
config := ratelimiter.Config{
MaxTokens: 100,
RefillInterval: time.Second,
}

limiter := ratelimiter.NewRateLimiter(config)

// Use limiter.Allow() to check if a request is within the rate limit
if limiter.Allow() {
sendRequest()
}
}
```
