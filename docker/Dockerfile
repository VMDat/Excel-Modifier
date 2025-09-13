FROM python:3.9-slim AS base

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM base AS builder
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    wget

# Build for Windows
FROM builder AS windows-builder
RUN pip install pyinstaller
COPY . .
RUN pyinstaller --onefile --name CSVProcessor --windowed src/app.py

# Build for Linux
FROM builder AS linux-builder
RUN pip install pyinstaller
COPY . .
RUN pyinstaller --onefile --name csv-processor src/app.py

# Build for macOS
FROM builder AS macos-builder
RUN pip install pyinstaller py2app
COPY . .
RUN pyinstaller --onefile --name CSVProcessor --windowed src/app.py