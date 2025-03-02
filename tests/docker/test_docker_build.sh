#!/bin/bash
# Docker image validation test
# Tests that the Docker image builds correctly and contains all required files

set -e  # Exit on any error

echo "=== Testing Docker Image Build ==="
echo "Building Docker image..."
docker build -t bikininjas/minecraft-server:test ../../

echo "Verifying Docker image..."
# Check if the image exists
if ! docker image inspect bikininjas/minecraft-server:test > /dev/null 2>&1; then
  echo "❌ ERROR: Docker image build failed"
  exit 1
fi

echo "✅ Docker image built successfully"

# Create a temporary container to check files
echo "Checking for required files in the image..."
CONTAINER_ID=$(docker create bikininjas/minecraft-server:test)

# Check for server files
docker cp $CONTAINER_ID:/app/run.jar /tmp/run.jar 2>/dev/null || { echo "❌ ERROR: Server JAR not found"; docker rm $CONTAINER_ID; exit 1; }
echo "✅ Server JAR found"

# Check for plugins
PLUGINS=("LuckPerms.jar" "SimpleVoiceChat.jar" "WorldEdit.jar" "Chunky.jar" "PlasmoVoice.jar" 
         "ViaVersion.jar" "Dynmap.jar" "TAB.jar" "DiscordSRV.jar" "CoreProtect.jar")

for plugin in "${PLUGINS[@]}"; do
  docker cp $CONTAINER_ID:/app/plugins/$plugin /tmp/$plugin 2>/dev/null || { echo "❌ ERROR: Plugin $plugin not found"; docker rm $CONTAINER_ID; exit 1; }
  echo "✅ Plugin $plugin found"
done

# Check for mods
docker cp $CONTAINER_ID:/app/mods/create-mod.jar /tmp/create-mod.jar 2>/dev/null || { echo "❌ ERROR: Create mod not found"; docker rm $CONTAINER_ID; exit 1; }
echo "✅ Create mod found"

# Check for config files
CONFIG_FILES=("server.properties" "ops.json" "whitelist.json" "eula.txt")
for config in "${CONFIG_FILES[@]}"; do
  docker cp $CONTAINER_ID:/app/$config /tmp/$config 2>/dev/null || { echo "❌ ERROR: Config file $config not found"; docker rm $CONTAINER_ID; exit 1; }
  echo "✅ Config file $config found"
done

# Clean up
docker rm $CONTAINER_ID
rm -f /tmp/run.jar /tmp/*.jar /tmp/server.properties /tmp/ops.json /tmp/whitelist.json /tmp/eula.txt

echo "=== All Docker image tests passed! ==="
