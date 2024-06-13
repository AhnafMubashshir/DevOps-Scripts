#!/bin/bash

# Update the package list and install the OpenSSH server
echo "Updating package list and installing OpenSSH server..."
sudo apt update
sudo apt install -y openssh-server

# Enable and start the SSH service
echo "Enabling and starting the SSH service..."
sudo systemctl enable ssh --now

# Enable UFW (Uncomplicated Firewall)
echo "Enabling UFW (Uncomplicated Firewall)..."
sudo ufw enable

# Backup the original UFW configuration file
echo "Backing up the original UFW configuration file..."
sudo cp /etc/default/ufw /etc/default/ufw.bak

# Modify UFW configuration to ensure IPv6 is enabled
echo "Modifying UFW configuration to ensure IPv6 is enabled..."
sudo sed -i 's/IPV6=no/IPV6=yes/' /etc/default/ufw

# Allow SSH connections through the firewall
echo "Allowing SSH connections through the firewall..."
sudo ufw allow ssh

# Check the status of UFW
echo "Checking the status of UFW..."
sudo ufw status

echo "SSH server installed and configured. UFW is enabled with SSH allowed."
