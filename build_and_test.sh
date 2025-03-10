#!/bin/bash

# Remove existing container if it exists
echo "Checking for existing container..."
if docker ps -a | grep -q mc-server-test; then
    echo "Removing existing container..."
    docker rm -f mc-server-test
fi

# Make sure jars directory exists
if [ ! -d "./jars" ]; then
    echo "Error: jars directory not found!"
    exit 1
fi

# List jars to verify they're available
echo "Available jar files:"
ls -la ./jars/

# Build the Docker image
echo "Building Docker image for Paper 1.21.1..."
docker build --no-cache -t bikininjas/minecraft-server:paper-1.21.1-test .

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # Run the Docker container
    echo "Starting container for testing..."
    echo "Press Ctrl+C to stop the container when done testing."
    
    docker run --rm -p 25565:25565 --name mc-server-test bikininjas/minecraft-server:paper-1.21.1-test
else
    echo "Build failed!"
    exit 1
fi
