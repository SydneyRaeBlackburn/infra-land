// TODO - review

package main

import (
	"fmt"
	"time"
)

type TokenBucket struct {
	refillrate int
	capacity   int
	tokens     int
	lastRefill time.Time
}

func NewTokenBucket(refillRate int, capacity int) *TokenBucket {
	return &TokenBucket{
		refillrate: refillRate,
		capacity:   capacity,
		tokens:     capacity,
		lastRefill: time.Now(),
	}
}

func (tb *TokenBucket) AllowRequest() bool {
	if tb.tokens != 0 {
		tb.tokens--
		return true
	}

	return false
}

func main() {
	tb := NewTokenBucket(2, 10)
	if tb.AllowRequest() {
		fmt.Println("Request allowed: ", tb.tokens, "tokens remaining")
	}
	fmt.Println(tb.tokens)
}
