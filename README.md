# Welcome to the Blocky World of bikininjas_mc_server! 🎮✨

## What is it?

This is a magical Docker image for running your very own Minecraft server with Java 21! 🏰✨ Dive into the world of creativity with the top NeoForge plugins and the amazing Create mod!

## Development & Release Process

This project follows semantic versioning and uses an automated CI/CD pipeline for releases:

- **Beta Releases**: Automatically created when code is pushed to a branch
- **Final Releases**: Promoted from beta releases and pushed to Docker Hub

For more details, see [Release Process](docs/RELEASE_PROCESS.md).

## Server Information

This server runs on NeoForge 21.1.122 with Java 21, providing a stable and feature-rich environment for your Minecraft adventures!

## Top 10 NeoForge Plugins

This server comes pre-loaded with the top 10 NeoForge plugins to enhance your gameplay:

1. **LuckPerms** ([Download](https://modrinth.com/plugin/luckperms)): A powerful permissions management plugin that lets you control the realm! 🛡️

2. **Simple Voice Chat** ([Download](https://modrinth.com/plugin/simple-voice-chat)): Talk to other players in-game with proximity-based voice chat! 🎙️

3. **WorldEdit** ([Download](https://modrinth.com/plugin/worldedit)): A powerful in-game map editor for building amazing structures quickly! 🏗️

4. **Chunky** ([Download](https://modrinth.com/plugin/chunky)): Pre-generates chunks quickly and efficiently to reduce server lag! ⚡

5. **Plasmo Voice** ([Download](https://modrinth.com/plugin/plasmo-voice)): Another excellent proximity voice chat option with audio positioning! 🔊

6. **ViaVersion** ([Download](https://modrinth.com/plugin/viaversion)): Allows newer clients to connect to older servers, improving compatibility! 🔄

7. **Dynmap** ([Download](https://modrinth.com/plugin/dynmap)): Creates a Google Maps-like map of your Minecraft world viewable in a browser! 🗺️

8. **TAB** ([Download](https://modrinth.com/plugin/tab-was-taken)): Customizes the player list and nameplates with advanced features! 📋

9. **DiscordSRV** ([Download](https://modrinth.com/plugin/discordsrv)): Bridges your Minecraft server chat with Discord for seamless communication! 💬

10. **CoreProtect** ([Download](https://modrinth.com/plugin/coreprotect)): Tracks block changes, item transactions, and more for easy rollbacks and inspections! 🔍

## Create Mod

The server includes the latest **Create Mod v6.0.0** ([Download](https://modrinth.com/mod/create/version/1.21.1-6.0.0)) compatible with Java 21 and Minecraft 1.21.1!

New features in Create 6.0.0 include:
- Chain conveyor and Item hatch
- Packager and Re-packager with Cardboard packages
- Stock link and Stock ticker
- Factory gauge and Pulse timer
- Cardboard armor set and sword
- Cherry, bamboo, and industrial iron windows
- And much more!

## LuckPerms Configuration

In this magical realm, the player "redPikPik" is the supreme admin, wielding the power to manage all plugins! 🌟

## Getting Started

1. Pull the Docker image
2. Run the container with port 25565 exposed
3. Connect to your server using Minecraft Java Edition 1.21.1
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
