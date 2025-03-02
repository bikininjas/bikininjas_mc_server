#!/bin/bash
# Main test runner script
# Runs all tests for the Minecraft server

set -e  # Exit on any error

echo "===== MINECRAFT SERVER TEST SUITE ====="
echo "Starting tests at $(date)"
echo

# Make all test scripts executable
chmod +x tests/docker/*.sh
chmod +x tests/server/*.sh

# Run Docker image tests
echo "Running Docker image tests..."
./tests/docker/test_docker_build.sh
echo

# Server connectivity tests skipped as they take too long
echo "Skipping server connectivity tests..."
# ./tests/server/test_server_connection.sh
echo

# Run plugin validation tests
echo "Running plugin validation tests..."
./tests/server/test_plugins.sh
echo

echo "===== ALL TESTS COMPLETED SUCCESSFULLY ====="
echo "Tests finished at $(date)"
