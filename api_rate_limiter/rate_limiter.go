package ratelimiter

import (
"sync"
"time"
)

type Config struct {
MaxTokens int
RefillInterval time.Duration
}

type RateLimiter struct {
mu sync.Mutex
config Config
tokens int
lastRefill time.Time
}

func NewRateLimiter(config Config) *RateLimiter {
return &RateLimiter{
config: config,
tokens: config.MaxTokens,
lastRefill: time.Now(),
}
}

func (rl *RateLimiter) Allow() bool {
rl.mu.Lock()
defer rl.mu.Unlock()

now := time.Now()
elapsed := now.Sub(rl.lastRefill)

if elapsed >= rl.config.RefillInterval {
tokensToAdd := elapsed / rl.config.RefillInterval
tokensToAddCount := int(tokensToAdd)
rl.tokens += tokensToAddCount
if rl.tokens > rl.config.MaxTokens {
rl.tokens = rl.config.MaxTokens
}
rl.lastRefill = rl.lastRefill.Add(time.Duration(tokensToAddCount) * rl.config.RefillInterval)
}

if rl.tokens > 0 {
rl.tokens--
return true
}
return false
}

func (rl *RateLimiter) Wait() {
for !rl.Allow() {
time.Sleep(10 * time.Millisecond)
}
}
