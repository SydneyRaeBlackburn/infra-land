from fastapi import FastAPI

api = FastAPI()

@api.get("/")
def read_root():
  """
  Root endpoint that returns a welcome message.
  """
  return {"message": "Welcome to my test-app demo!"}