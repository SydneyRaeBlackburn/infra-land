FROM python:3.14.2-alpine AS build

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY api.py .

EXPOSE 8080

CMD ["fastapi", "run", "api.py", "--port", "8080"]