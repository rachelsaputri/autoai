package main

import (
"fmt"
"sync"
"time"
)

type RateLimiter struct {
mu sync.Mutex
maxTokens int
tokens int
lastRefill time.Time
refillInterval time.Duration
}

func NewRateLimiter(maxTokens int, refillInterval time.Duration) *RateLimiter {
return &RateLimiter{
maxTokens: maxTokens,
tokens: maxTokens,
lastRefill: time.Now(),
refillInterval: refillInterval,
}
}

func (rl *RateLimiter) Allow() bool {
rl.mu.Lock()
defer rl.mu.Unlock()

now := time.Now()
elapsed := now.Sub(rl.lastRefill)
tokensToAdd := int(elapsed / rl.refillInterval)

if tokensToAdd > 0 {
rl.tokens += tokensToAdd
if rl.tokens > rl.maxTokens {
rl.tokens = rl.maxTokens
}
rl.lastRefill = rl.lastRefill.Add(time.Duration(tokensToAdd) * rl.refillInterval)
}

if rl.tokens > 0 {
rl.tokens--
return true
}
return false
}

func main() {
limiter := NewRateLimiter(5, time.Second)

var wg sync.WaitGroup
for i := 0; i < 10; i++ {
wg.Add(1)
go func(id int) {
defer wg.Done()
if limiter.Allow() {
fmt.Printf("Request %d allowed\n", id)
} else {
fmt.Printf("Request %d throttled\n", id)
}
}(i)
}
wg.Wait()
}
