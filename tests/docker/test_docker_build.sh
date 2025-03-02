#!/bin/bash
# Docker image validation test
# Tests that the Docker image builds correctly and contains all required files

set -e  # Exit on any error

echo "=== Testing Docker Image Build ==="
echo "Building Docker image..."
REPO_ROOT="$(cd "$(dirname "$0")/../../" && pwd)"
echo "Using Dockerfile from: $REPO_ROOT"
docker build -t bikininjas/minecraft-server:test "$REPO_ROOT"

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
docker cp $CONTAINER_ID:/app/run.sh /tmp/run.sh 2>/dev/null || { echo "❌ ERROR: Server run script not found"; docker rm $CONTAINER_ID; exit 1; }
echo "✅ Server run script found"

# Check for Paper JAR
docker cp $CONTAINER_ID:/app/paper.jar /tmp/paper.jar 2>/dev/null || { echo "❌ ERROR: Paper server JAR not found"; docker rm $CONTAINER_ID; exit 1; }
echo "✅ Paper server JAR found"

# Paper includes Minecraft server, no need to check for separate Minecraft JAR

# Check for plugins
PLUGINS=("UltraPermissions.jar" "WorldEdit.jar" "Chunky.jar" 
         "ViaVersion.jar" "Dynmap.jar" "TAB.jar" "DiscordSRV.jar" "CoreProtect.jar" 
         "EssentialsX.jar" "VaultUnlocked.jar" "Multiverse-Core.jar" 
         "UltraEconomy.jar" "ItemsAdder.jar" "Reforges.jar" "mcMMO.jar")

for plugin in "${PLUGINS[@]}"; do
  docker cp $CONTAINER_ID:/app/plugins/$plugin /tmp/$plugin 2>/dev/null || { echo "❌ ERROR: Plugin $plugin not found"; docker rm $CONTAINER_ID; exit 1; }
  echo "✅ Plugin $plugin found"
done

# Paper doesn't use mods, it uses plugins which we've already checked

# Check for config files
CONFIG_FILES=("server.properties" "ops.json" "whitelist.json" "eula.txt")
for config in "${CONFIG_FILES[@]}"; do
  docker cp $CONTAINER_ID:/app/$config /tmp/$config 2>/dev/null || { echo "❌ ERROR: Config file $config not found"; docker rm $CONTAINER_ID; exit 1; }
  echo "✅ Config file $config found"
done

# Clean up
docker rm $CONTAINER_ID
rm -f /tmp/run.sh /tmp/*.jar /tmp/server.properties /tmp/ops.json /tmp/whitelist.json /tmp/eula.txt

echo "=== All Docker image tests passed! ==="
