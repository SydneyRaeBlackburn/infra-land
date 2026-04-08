import time

class LeakyBucket:
  def __init__(self, capacity, leak_rate):
    """
    :param capacity: Maximum number of requests the bucket can hold.
    :param leak_rate: Requests processed per second.
    """
    self.capacity = capacity
    self.leak_rate = leak_rate
    self.current_volume = 0
    self.last_updated = time.time()

  def _leak(self):
    """Calculates how much the bucket has leaked since the last check."""
    now = time.time()
    elapsed = now - self.last_updated

    # Amount leaked = time passed * leak rate
    leaked_amount = elapsed * self.leak_rate
    
    # Update bucket size (cannot go below 0)
    self.current_volume = max(0, self.current_volume - leaked_amount)
    self.last_updated = now

  def add_request(self):
    """
    Attempt to add a single request to the bucket.
    Returns True if successful, False if the bucket is full.
    """
    self._leak()
    if self.current_volume + 1 <= self.capacity:
      self.current_volume += 1
      return True
    return False

# --- Usage Example ---
# Bucket capacity of 5, leak rate at 1 token per second

if __name__ == "__main__":
  limiter = LeakyBucket(capacity=5, leak_rate=1) # 5 slots, leaks 1/sec

  for i in range(1, 9):
    if limiter.add_request():
        print(f"Request {i}: Accepted: (Bucket Volume: {limiter.current_volume:.2f})")
    else:
        print(f"Request {i}: Discarded (Bucket Full)")
        time.sleep(1)
    time.sleep(0.2) # Rapid fire requests
