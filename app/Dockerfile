FROM python:3.14.0-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY hello_world.py .

ARG APPLICATION_VERSION=v0.0.0-dev # Temporary default value, will be overwritten by GitHub Actions workflow

ENV APP_VERSION=${APPLICATION_VERSION}

CMD ["python", "hello_world.py"]