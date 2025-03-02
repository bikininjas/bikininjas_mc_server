#!/bin/bash

# Bikininjas Minecraft Server Startup Script
# Optimized for Java 21 with Aikar's flags

# Memory allocation (adjust as needed)
MEMORY_MIN="4G"
MEMORY_MAX="4G"

# Java executable
JAVA="java"

# Server JAR file
JAR_FILE="run.jar"

# Check if Java is installed
if ! command -v $JAVA &> /dev/null; then
    echo "Java not found. Please install Java 21 or higher."
    exit 1
fi

# Check Java version
JAVA_VER=$($JAVA -version 2>&1 | awk -F '"' '/version/ {print $2}')
echo "Using Java version: $JAVA_VER"

# Launch the server with optimized flags
echo "Starting Bikininjas Minecraft Server..."
$JAVA \
  -Xms$MEMORY_MIN \
  -Xmx$MEMORY_MAX \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -Dusing.aikars.flags=https://mcflags.emc.gs \
  -Daikars.new.flags=true \
  -jar $JAR_FILE nogui

# Exit with the server's exit code
exit $?
