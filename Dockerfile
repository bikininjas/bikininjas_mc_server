FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Create directory for plugins
RUN mkdir -p /app/plugins

# Define Paper version
ENV PAPER_VERSION=1.21.1
ENV PAPER_BUILD=99

# Download Paper server
RUN curl -o /app/paper.jar https://api.papermc.io/v2/projects/paper/versions/${PAPER_VERSION}/builds/${PAPER_BUILD}/downloads/paper-${PAPER_VERSION}-${PAPER_BUILD}.jar

# Download plugins compatible with 1.21.1
RUN curl -L -o /app/plugins/LuckPerms.jar https://download.luckperms.net/1573/bukkit/loader/LuckPerms-Bukkit-5.4.156.jar && \
    curl -L -o /app/plugins/WorldEdit.jar https://cdn.modrinth.com/data/1u6JkXh5/versions/Bu1zaaoc/worldedit-bukkit-7.3.9.jar && \
    curl -L -o /app/plugins/Chunky.jar https://cdn.modrinth.com/data/fALzjamp/versions/ytBhnGfO/Chunky-Bukkit-1.4.28.jar && \
    curl -L -o /app/plugins/ViaVersion.jar https://cdn.modrinth.com/data/P1OZGk5p/versions/Wry9t810/ViaVersion-5.2.2-SNAPSHOT.jar && \
    curl -L -o /app/plugins/Dynmap.jar https://cdn.modrinth.com/data/fRQREgAc/versions/1pMUPhY2/Dynmap-3.7-beta-8-fabric-1.21.jar && \
    curl -L -o /app/plugins/TAB.jar https://github.com/NEZNAMY/TAB/releases/download/5.0.7/TAB.v5.0.7.jar && \
    curl -L -o /app/plugins/DiscordSRV.jar https://github.com/DiscordSRV/DiscordSRV/releases/download/v1.27.0/DiscordSRV-Build-1.27.0.jar && \
    curl -L -o /app/plugins/CoreProtect.jar https://cdn.modrinth.com/data/Lu3KuzdV/versions/mvLpRWww/CoreProtect-21.3.jar && \
    curl -L -o /app/plugins/EssentialsX.jar https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar && \
    curl -L -o /app/plugins/Multiverse-Core.jar https://media.forgecdn.net/files/4580/385/Multiverse-Core-4.3.11.jar && \
    curl -L -o /app/plugins/UltraPermissions.jar https://www.spigotmc.org/resources/ultra-permissions.42678/download?version=569283

# Create server configuration files
COPY server.properties /app/server.properties
COPY paper.yml /app/paper.yml
COPY spigot.yml /app/spigot.yml
COPY bukkit.yml /app/bukkit.yml
COPY commands.yml /app/commands.yml
COPY luckperms.yml /app/plugins/luckperms/luckperms.yml
COPY ops.json /app/ops.json
COPY whitelist.json /app/whitelist.json

# Expose the Minecraft server port
EXPOSE 25565

# Accept EULA
RUN echo "eula=true" > /app/eula.txt

# Configure optimized JVM arguments (Aikar's flags)
ENV JAVA_OPTS="-Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"

# Start the Paper server
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/paper.jar nogui"]
