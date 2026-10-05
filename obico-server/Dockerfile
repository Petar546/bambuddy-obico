# syntax=docker/dockerfile:1
FROM python:3.10-slim-bullseye
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev libjpeg-dev libcurl4-openssl-dev \
    libssl-dev ffmpeg libsm6 libxext6 git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1
COPY backend/requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY backend/ /app/
EXPOSE 8000
CMD ["./scripts/start-web.sh"]

