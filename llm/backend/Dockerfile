FROM python:3.12-slim

WORKDIR /app

# Install system dependencies required for Playwright and other libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libxrender1 \
    libxtst6 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright and its system dependencies
RUN playwright install chromium
RUN playwright install-deps chromium

# Create directory for file uploads
RUN mkdir -p /app/uploads

# Copy the rest of the application
COPY . .

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
