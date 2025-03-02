# Changelog

## [Unreleased] - Paper 1.21.1 Update

### Added
- Switched to Paper 1.21.1 server implementation
- Added paper.yml configuration file with optimized settings
- Added spigot.yml configuration file with optimized settings
- Added bukkit.yml configuration file with optimized settings
- Added commands.yml with useful command aliases
- Added build_and_test.sh script for easy testing

### Changed
- Updated Dockerfile to use Paper 1.21.1 instead of NeoForge
- Updated server.properties to be compatible with Paper 1.21.1
- Updated plugin URLs and versions for Paper compatibility
- Updated README.md to reflect Paper server information
- Fixed CMD line in Dockerfile to properly use environment variables

### Removed
- Removed NeoForge-specific configurations and dependencies
- Removed Create mod references as it's not compatible with Paper

## [1.0.0] - Initial Release

### Added
- Initial NeoForge server implementation
- Basic server configuration
- Top 10 NeoForge plugins
- Create mod integration
- Docker container setup
- GitHub Actions workflows for CI/CD
