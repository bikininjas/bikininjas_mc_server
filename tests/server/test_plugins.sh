#!/bin/bash
# Plugin validation test
# Tests that the plugins are loaded correctly by the server

set -e  # Exit on any error

echo "=== Testing Plugin Loading ==="
echo "Starting Minecraft server in Docker container..."

# Start the server in a container with volume for logs
mkdir -p /tmp/mc-test-logs
CONTAINER_ID=$(docker run -d -p 25566:25565 -v /tmp/mc-test-logs:/app/logs --name mc-plugin-test-server bikininjas/minecraft-server:test)

# Wait for server to start (adjust timeout as needed)
echo "Waiting for server to start (this may take a minute)..."
TIMEOUT=120
ELAPSED=0
SERVER_STARTED=false

while [ $ELAPSED -lt $TIMEOUT ]; do
  if docker logs mc-plugin-test-server 2>&1 | grep -q "Done"; then
    SERVER_STARTED=true
    break
  fi
  sleep 5
  ELAPSED=$((ELAPSED + 5))
  echo "Still waiting... ($ELAPSED seconds elapsed)"
done

if [ "$SERVER_STARTED" = false ]; then
  echo "❌ ERROR: Server failed to start within $TIMEOUT seconds"
  docker logs mc-plugin-test-server
  docker stop mc-plugin-test-server
  docker rm mc-plugin-test-server
  rm -rf /tmp/mc-test-logs
  exit 1
fi

echo "✅ Server started successfully"

# Wait a bit more for plugins to fully load
sleep 10

# Check logs for plugin loading messages
echo "Checking for plugin loading messages in logs..."

PLUGINS=("LuckPerms" "Simple Voice Chat" "WorldEdit" "Chunky" "PlasmoVoice" 
         "ViaVersion" "Dynmap" "TAB" "DiscordSRV" "CoreProtect")

# Combine all log files
cat /tmp/mc-test-logs/latest.log > /tmp/combined.log

# Check for each plugin
for plugin in "${PLUGINS[@]}"; do
  if ! grep -i "$plugin" /tmp/combined.log > /dev/null; then
    echo "⚠️ WARNING: No loading message found for plugin: $plugin"
  else
    echo "✅ Plugin $plugin loaded successfully"
  fi
done

# Check for Create mod
if ! grep -i "create" /tmp/combined.log > /dev/null; then
  echo "⚠️ WARNING: No loading message found for Create mod"
else
  echo "✅ Create mod loaded successfully"
fi

# Clean up
echo "Stopping and removing test container..."
docker stop mc-plugin-test-server
docker rm mc-plugin-test-server
rm -rf /tmp/mc-test-logs
rm -f /tmp/combined.log

echo "=== Plugin validation tests completed! ==="
