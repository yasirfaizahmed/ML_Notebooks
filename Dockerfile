FROM python:3.12-slim

# Create app directory
WORKDIR /ML_notebook

# Install system dependencies (needed for common ML packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libopenblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first for better layer caching
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . /ML_notebook/

# Start a bash shell to keep the container running
CMD ["bash"]
