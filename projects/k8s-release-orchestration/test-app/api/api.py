from fastapi import FastAPI, Request

api = FastAPI()

@api.get("/")
def read_root(request: Request):
  """
  Root endpoint that returns a welcome message.
  """
  return {
    "message": "Welcome to my test-app demo!",
    "client_host": request.client.host 
  }