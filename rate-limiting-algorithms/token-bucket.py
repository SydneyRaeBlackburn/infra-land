import time

class TokenBucket:
  def __init__(self, capacity, refill_rate):
    """
    :param capacity: Maximum number of tokens the bucket can hold.
    :param refill_rate: Tokens added per second.
    """
    self.capacity = capacity
    self.refill_rate = refill_rate
    self.tokens = capacity
    self.last_refill_time = time.time()

  def _refill(self):
    now = time.time()
    # Calculate how many tokens were generated since the last check
    elapsed = now - self.last_refill_time
    new_tokens = elapsed * self.refill_rate
    
    # Add tokens to bucket without exceeding capacity
    self.tokens = min(self.capacity, self.tokens + new_tokens)
    self.last_refill_time = now

  def consume(self, amount=1):
    """Returns True if tokens were consumed, False otherwise."""
    self._refill()
    if self.tokens >= amount:
      self.tokens -= amount
      return True
    return False

# --- Usage Example ---
# Bucket capacity of 5, refilling at 1 token per second

if __name__ == "__main__":
  limiter = TokenBucket(capacity=5, refill_rate=1)

  for i in range(10):
    if limiter.consume(1):
      print(f"Request {i+1}: Allowed (Tokens: {limiter.tokens:.2f})")
    else:
      print(f"Request {i+1}: Rate Limited")
    time.sleep(0.5)  # Wait 0.5 seconds between requests

  
# if __name__ == "__main__":
#   solution = Solution()
#   print(solution.romanToInt("DCXXI"))