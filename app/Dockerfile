FROM python:3.14.0-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY hello_world.py .

ARG application_version=0.0.0

ENV APP_VERSION={application_version}

CMD ["python", "hello_world.py"]