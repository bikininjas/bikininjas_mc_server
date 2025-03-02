#!/bin/bash
# Server connectivity test
# Tests that the Minecraft server starts up and accepts connections

set -e  # Exit on any error

echo "=== Testing Server Connectivity ==="
echo "Starting Minecraft server in Docker container..."

# Start the server in a container
CONTAINER_ID=$(docker run -d -p 25565:25565 --name mc-test-server bikininjas/minecraft-server:test)

# Wait for server to start (adjust timeout as needed)
echo "Waiting for server to start (this may take a minute)..."
TIMEOUT=120
ELAPSED=0
SERVER_STARTED=false

while [ $ELAPSED -lt $TIMEOUT ]; do
  if docker logs mc-test-server 2>&1 | grep -q "Done"; then
    SERVER_STARTED=true
    break
  fi
  sleep 5
  ELAPSED=$((ELAPSED + 5))
  echo "Still waiting... ($ELAPSED seconds elapsed)"
done

if [ "$SERVER_STARTED" = false ]; then
  echo "❌ ERROR: Server failed to start within $TIMEOUT seconds"
  docker logs mc-test-server
  docker stop mc-test-server
  docker rm mc-test-server
  exit 1
fi

echo "✅ Server started successfully"

# Test server connectivity using mcstatus (Python tool)
# First check if mcstatus is installed
if ! command -v mcstatus &> /dev/null; then
  echo "Installing mcstatus..."
  pip install mcstatus
fi

echo "Testing server connectivity..."
if ! mcstatus localhost:25565 status; then
  echo "❌ ERROR: Failed to connect to the server"
  docker logs mc-test-server
  docker stop mc-test-server
  docker rm mc-test-server
  exit 1
fi

echo "✅ Successfully connected to the server"

# Clean up
echo "Stopping and removing test container..."
docker stop mc-test-server
docker rm mc-test-server

echo "=== All server connectivity tests passed! ==="
