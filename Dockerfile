FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg libsndfile1 unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY afterglow.zip .
RUN unzip afterglow.zip && pip install --no-cache-dir -r afterglow/backend/requirements.txt
ENV AFTERGLOW_DATA=/data
WORKDIR /app/afterglow/backend
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}
