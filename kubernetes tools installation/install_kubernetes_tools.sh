#!/bin/bash

# Script to install Kubernetes tools on a Debian-based system

# Install kubelet, kubeadm, and kubectl, and pin their versions
echo "Installing kubelet, kubeadm, and kubectl..."
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Enable the kubelet service before running kubeadm
echo "Enabling the kubelet service..."
sudo systemctl enable --now kubelet

echo "Kubernetes tools installation completed successfully."
