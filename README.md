# Welcome to the Blocky World of bikininjas_mc_server! 🎮✨

## What is it?

This is a magical Docker image for running your very own Minecraft server with Java 21! 🏰✨ Dive into the world of creativity with the top Paper plugins optimized for Minecraft 1.21.1!

## Tips for Adventurers!
- **Gather Resources**: Always start by gathering wood and stone to build your first shelter! 🪨
- **Explore**: Venture into caves for precious ores and discover hidden treasures! 💎
- **Craft Wisely**: Use your crafting table to create tools and weapons that will aid you in your adventures! ⚔️

## Development & Release Process

This project follows semantic versioning and uses an automated CI/CD pipeline for releases:

- **Beta Releases**: Automatically created when code is pushed to a branch
- **Final Releases**: Promoted from beta releases and pushed to Docker Hub

For more details, see [Release Process](docs/RELEASE_PROCESS.md).

## Server Information

This server runs on Paper 1.21.1 with Java 21, providing a stable and feature-rich environment for your Minecraft adventures!

## Top 10 Paper Plugins

This server comes pre-loaded with the top 10 Paper plugins to enhance your gameplay:

1. **LuckPerms** ([Download](https://luckperms.net/)): A powerful permissions management plugin that lets you control the realm! 🛡️

2. **WorldEdit** ([Download](https://dev.bukkit.org/projects/worldedit)): A powerful in-game map editor for building amazing structures quickly! 🏗️

3. **Chunky** ([Download](https://modrinth.com/plugin/chunky)): Pre-generates chunks quickly and efficiently to reduce server lag! ⚡

4. **ViaVersion** ([Download](https://modrinth.com/plugin/viaversion)): Allows newer clients to connect to older servers, improving compatibility! 🔄

5. **Dynmap** ([Download](https://dynmap.us/)): Creates a Google Maps-like map of your Minecraft world viewable in a browser! 🗺️

6. **TAB** ([Download](https://github.com/NEZNAMY/TAB)): Customizes the player list and nameplates with advanced features! 📋

7. **DiscordSRV** ([Download](https://github.com/DiscordSRV/DiscordSRV)): Bridges your Minecraft server chat with Discord for seamless communication! 💬

8. **CoreProtect** ([Download](https://modrinth.com/plugin/coreprotect)): Tracks block changes, item transactions, and more for easy rollbacks and inspections! 🔍

9. **EssentialsX** ([Download](https://essentialsx.net/)): The essential plugin suite for Bukkit servers with hundreds of useful commands and features! 🧰

10. **Multiverse-Core** ([Download](https://dev.bukkit.org/projects/multiverse-core)): Create and manage multiple worlds with different settings and gamemodes! 🌎

## Paper Performance

This server uses Paper, a high-performance fork of Spigot that significantly improves server performance while maintaining plugin compatibility. Benefits include:

- Dramatically improved TPS (ticks per second)
- Better chunk loading and entity handling
- Reduced memory usage and CPU load
- Extensive configuration options for optimization
- Regular updates and security patches
- Full compatibility with Bukkit/Spigot plugins

## LuckPerms Configuration

In this magical realm, the player "redPikPik" is the supreme admin, wielding the power to manage all plugins! 🌟

## Getting Started

1. Pull the Docker image
2. Run the container with port 25565 exposed
3. Connect to your server using Minecraft Java Edition 1.21.4
4. Enjoy your adventure!

## Server Configuration

The server is pre-configured with optimal settings for performance and gameplay:

- **Server Name**: Bikininjas World
- **Admin**: redPikPik has full administrative privileges
- **Performance**: Optimized Java 21 flags for maximum performance
- **Memory**: 4GB allocated for smooth gameplay
- **Command Blocks**: Enabled for advanced creations
- **View Distance**: 10 chunks for balance between performance and visibility

## Java 21 Optimization

This server uses Aikar's optimized JVM flags for Java 21, which provide:

- Improved garbage collection with G1GC
- Reduced lag spikes and stuttering
- Better memory management
- Overall smoother gameplay experience

You can run the server outside Docker using the included `start.sh` script, which contains the same optimized settings.

## Testing

This project includes comprehensive testing to ensure everything works correctly:

- **Docker Image Tests**: Verify that the Docker image builds correctly and contains all required files
- **Server Connectivity Tests**: Ensure the server starts up and accepts connections
- **Plugin Validation Tests**: Check that all plugins and mods load correctly

To run all tests:

```bash
./run_tests.sh
```

See the [tests/README.md](tests/README.md) for more details on individual tests.

## CI/CD

This project uses GitHub Actions for continuous integration and deployment:

- Automatically builds and tests the Docker image when pull requests are created
- Auto-merges PRs to master if all tests pass
- Creates semantic version tags and releases when changes are merged to master
- Deploys the Docker image to Docker Hub with appropriate tags

Get ready to craft, explore, and build your own Minecraft adventure! If you have any questions or need help, just shout! 📣
