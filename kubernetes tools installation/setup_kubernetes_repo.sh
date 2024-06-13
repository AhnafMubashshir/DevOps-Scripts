#!/bin/bash

# Script to set up the Kubernetes apt repository on a Debian-based system

# Update the package index and install necessary packages
echo "Updating the package index and installing necessary packages..."
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# Create the /etc/apt/keyrings directory if it doesn't exist
echo "Creating /etc/apt/keyrings directory if it doesn't exist..."
sudo mkdir -p -m 755 /etc/apt/keyrings

# Download the public signing key for the Kubernetes package repositories
echo "Downloading the public signing key for Kubernetes package repositories..."
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the Kubernetes apt repository
echo "Adding the Kubernetes apt repository..."
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package index again
echo "Updating the package index again..."
sudo apt-get update -y

echo "Kubernetes repository setup completed successfully."
