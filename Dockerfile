FROM python:3.12-slim

# Create app directory
WORKDIR /ML_Notebooks

# Install system dependencies (needed for common ML packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libopenblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first for better layer caching
COPY requirements.txt /ML_Notebooks

# Install Python dependencies
RUN PIP_ROOT_USER_ACTION=ignore pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . /ML_Notebooks/

# Start a bash shell to keep the container running
CMD ["bash"]

# docker build -t ml_notebooks:$(date +%F) .
# docker run -dit --name notebook1 ml_notebooks:2025-06-15 bash