FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Download Minecraft server and plugins
RUN curl -O https://papermc.io/downloads#latest && \
    curl -O https://example.com/plugins/LuckPerms.jar && \
    curl -O https://example.com/plugins/EssentialsX.jar && \
    curl -O https://example.com/plugins/Vault.jar && \
    curl -O https://example.com/plugins/Create.jar && \
    curl -O https://example.com/plugins/Plugin5.jar && \
    curl -O https://example.com/plugins/Plugin6.jar && \
    curl -O https://example.com/plugins/Plugin7.jar && \
    curl -O https://example.com/plugins/Plugin8.jar && \
    curl -O https://example.com/plugins/Plugin9.jar && \
    curl -O https://example.com/plugins/Plugin10.jar

# Copy LuckPerms configuration file
COPY luckperms.yml /app/luckperms.yml

# Expose the Minecraft server port
EXPOSE 25565

# Start the Minecraft server
CMD ["java", "-jar", "paper.jar"]
