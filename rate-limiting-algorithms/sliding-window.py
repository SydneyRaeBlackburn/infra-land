import time
from collections import deque

class SlidingWindow:
  def __init__(self, max_requests, window_size_seconds):
    """
    :param max_requests: Max allowed requests in the window.
    :param window_size_seconds: The rolling window duration (e.g., 60 for 1 minute).
    """
    self.max_requests = max_requests
    self.window_size = window_size_seconds
    self.requests = deque()

  def allow_request(self):
    now = time.time()
    
    # 1. Slide the window: Remove timestamps older than (now - window_size)
    while self.requests and self.requests[0] <= now - self.window_size:
        self.requests.popleft()
    
    # 2. Check if there is room for a new request
    if len(self.requests) < self.max_requests:
        self.requests.append(now)
        return True
    
    # 3. Rate limit exceeded
    return False

# --- Usage Example ---

if __name__ == "__main__":
  limiter = SlidingWindow(max_requests=5, window_size_seconds=10)

  for i in range(1,8):
    if limiter.allow_request():
        print(f"Request {i}: Success")
    else:
        print(f"Request {i}: Rate limited!")
    time.sleep(1)
