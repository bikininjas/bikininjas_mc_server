# Minecraft Server Tests

This directory contains tests for the Bikininjas Minecraft server.

## Test Structure

- `docker/` - Tests related to Docker image building and validation
- `server/` - Tests related to server functionality and plugins

## Running Tests

You can run all tests using the main test script:

```bash
./run_tests.sh
```

Or run individual test categories:

```bash
# Docker image tests
cd tests/docker
./test_docker_build.sh

# Server connectivity tests
cd tests/server
./test_server_connection.sh

# Plugin validation tests
cd tests/server
./test_plugins.sh
```

## Test Descriptions

### Docker Image Tests

- Verifies that the Docker image builds correctly
- Checks that all required files (server JAR, plugins, mods, config files) are present in the image

### Server Connectivity Tests

- Starts the server in a Docker container
- Waits for the server to fully initialize
- Tests that the server is accepting connections using mcstatus

### Plugin Validation Tests

- Starts the server in a Docker container
- Checks server logs to verify that all plugins and mods are loading correctly

## Requirements

- Docker
- Python with mcstatus (`pip install mcstatus`)

## CI Integration

These tests are automatically run in the GitHub Actions workflow when pull requests are created or updated.
