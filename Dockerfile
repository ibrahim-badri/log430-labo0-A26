# Use a lightweight Python 3.11 base image
FROM python:3.11-slim

# Set /app as the working directory inside the container
WORKDIR /app

# Copy the application source code into the container
COPY src/ ./src/

# Copy the Python dependencies file into the container
COPY requirements.txt ./

# Add the source directory to Python's module search path
ENV PYTHONPATH=/app/src

# Install Linux process monitoring utilities such as top and ps
RUN apt-get update \
    && apt-get install -y procps \
    && rm -rf /var/lib/apt/lists/*

# Install the required Python dependencies without caching package files
RUN pip install --no-cache-dir -r requirements.txt