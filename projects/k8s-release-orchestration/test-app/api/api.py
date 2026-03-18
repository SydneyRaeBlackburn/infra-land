from fastapi import FastAPI # pyright: ignore[reportMissingImports]
import os

api = FastAPI()

image_tag = os.environ.get("IMAGE_TAG", "")

@api.get("/")
def read_root():
  """
  Root endpoint that returns a welcome message.
  """
  return {
    "message": "Welcome to my test-app demo!",
    "image_tag": image_tag
  }