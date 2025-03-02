FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Create directories for mods and plugins
RUN mkdir -p /app/mods /app/plugins

# Download NeoForge and server files
RUN curl -o neoforge-installer.jar https://maven.neoforged.net/releases/net/neoforged/neoforge/21.1.122/neoforge-21.1.122-installer.jar && \
    java -jar neoforge-installer.jar --installServer && \
    rm neoforge-installer.jar

# Download top 10 NeoForge plugins
RUN curl -L -o /app/plugins/LuckPerms.jar https://cdn.modrinth.com/data/Vebnzrzj/versions/5.4.113/LuckPerms-Bukkit-5.4.113.jar && \
    curl -L -o /app/plugins/SimpleVoiceChat.jar https://cdn.modrinth.com/data/9eGKb6K1/versions/bukkit-2.5.9/voicechat-bukkit-2.5.9.jar && \
    curl -L -o /app/plugins/WorldEdit.jar https://cdn.modrinth.com/data/kkjrWcj9/versions/7.2.18+6575-2d8be55/worldedit-bukkit-7.2.18.jar && \
    curl -L -o /app/plugins/Chunky.jar https://cdn.modrinth.com/data/fALzjamp/versions/1.3.92/Chunky-1.3.92.jar && \
    curl -L -o /app/plugins/PlasmoVoice.jar https://cdn.modrinth.com/data/1bZhdhsH/versions/2.0.6/plasmovoice-bukkit-2.0.6.jar && \
    curl -L -o /app/plugins/ViaVersion.jar https://cdn.modrinth.com/data/YlVPIjsY/versions/4.9.2/ViaVersion-4.9.2.jar && \
    curl -L -o /app/plugins/Dynmap.jar https://cdn.modrinth.com/data/fRQREgAc/versions/3.7-beta-2/Dynmap-3.7-beta-2-spigot.jar && \
    curl -L -o /app/plugins/TAB.jar https://cdn.modrinth.com/data/Gd7Uq1Dn/versions/4.0.2/TAB-4.0.2.jar && \
    curl -L -o /app/plugins/DiscordSRV.jar https://cdn.modrinth.com/data/QO01UOV5/versions/1.27.0/DiscordSRV-Build-1.27.0.jar && \
    curl -L -o /app/plugins/CoreProtect.jar https://cdn.modrinth.com/data/Lu3KuzdV/versions/21.3/CoreProtect-21.3.jar

# Download Create mod (latest version compatible with Java 21)
RUN curl -L -o /app/mods/create-mod.jar https://cdn.modrinth.com/data/LNytGWDc/versions/NEb0yK69/create-1.21.1-6.0.0.jar

# Create server configuration files
COPY server.properties /app/server.properties
COPY luckperms.yml /app/plugins/luckperms/luckperms.yml
COPY ops.json /app/ops.json
COPY whitelist.json /app/whitelist.json

# Expose the Minecraft server port
EXPOSE 25565

# Accept EULA
RUN echo "eula=true" > /app/eula.txt

# Start the NeoForge server with optimized Java 21 flags
CMD ["java", "-Xmx4G", "-Xms4G", "-XX:+UseG1GC", "-XX:+ParallelRefProcEnabled", "-XX:MaxGCPauseMillis=200", "-XX:+UnlockExperimentalVMOptions", "-XX:+DisableExplicitGC", "-XX:+AlwaysPreTouch", "-XX:G1NewSizePercent=30", "-XX:G1MaxNewSizePercent=40", "-XX:G1HeapRegionSize=8M", "-XX:G1ReservePercent=20", "-XX:G1HeapWastePercent=5", "-XX:G1MixedGCCountTarget=4", "-XX:InitiatingHeapOccupancyPercent=15", "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:SurvivorRatio=32", "-XX:+PerfDisableSharedMem", "-XX:MaxTenuringThreshold=1", "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true", "-jar", "run.jar", "nogui"]
