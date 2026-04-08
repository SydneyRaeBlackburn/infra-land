import time

class FixedWindow:
  def __init__(self, limit, window_seconds):
    self.limit = limit
    self.window_seconds = window_seconds
    self.counter = 0
    self.window_start = time.time()

  def allow_request(self) -> bool:
    current_time = time.time()

    # Check if we have moved into a new window
    if current_time - self.window_start >= self.window_seconds:
      self.window_start = current_time
      self.counter = 0

    # Check if the limit has been reached
    if self.counter < self.limit:
      self.counter += 1
      return True
    
    return False

# --- Usage Example ---

if __name__ == "__main__":
  limiter = FixedWindow(limit=5, window_seconds=10)

  for i in range(1,8):
    if limiter.allow_request():
        print(f"Request {i}: Success")
    else:
        print(f"Request {i}: Rate limited!")
    time.sleep(1)