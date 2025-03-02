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
cd tests/docker
./test_docker_build.sh
cd ../..
echo

# Run server connectivity tests
echo "Running server connectivity tests..."
cd tests/server
./test_server_connection.sh
cd ../..
echo

# Run plugin validation tests
echo "Running plugin validation tests..."
cd tests/server
./test_plugins.sh
cd ../..
echo

echo "===== ALL TESTS COMPLETED SUCCESSFULLY ====="
echo "Tests finished at $(date)"
