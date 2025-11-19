FROM python:3.14.0-alpine AS build

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.14.0-alpine

WORKDIR /app
COPY script.py .
CMD ["python", "script.py"]