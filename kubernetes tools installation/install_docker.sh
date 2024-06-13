#!/bin/bash

# Script to install Docker on a Debian-based system using the docker.io package

# Update the package database
echo "Updating the package database..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker.io

# Enable Docker service to start on boot
echo "Enabling Docker service to start on boot..."
sudo systemctl enable docker

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Verify Docker installation
echo "Verifying Docker installation..."
sudo docker --version

echo "Docker installation completed successfully."
