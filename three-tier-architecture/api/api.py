from fastapi import FastAPI

api = FastAPI()

foods = [ "sushi", "pizza", "burrito" ]

@api.get("/")
def read_root():
  """
  Root endpoint that returns a welcome message.
  """
  return {"message": "Welcome to my Three-Tier Architecture demo!"}

@api.get("/foods/")
def read_foods():
  """
  Returns a list of foods.
  """
  return foods