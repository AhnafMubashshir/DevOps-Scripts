#!/bin/bash

# Script to make other scripts executable and run them sequentially

# Define the script filenames
SCRIPTS=("install_docker.sh" "setup_kubernetes_repo.sh" "install_kubernetes_tools.sh")

# Loop through each script
for SCRIPT in "${SCRIPTS[@]}"
do
  # Make the script executable
  echo "Making $SCRIPT executable..."
  chmod +x "$SCRIPT"

  # Run the script with superuser privileges
  echo "Running $SCRIPT..."
  sudo ./"$SCRIPT"

  # Check if the script ran successfully
  if [ $? -eq 0 ]; then
    echo "$SCRIPT executed successfully."
  else
    echo "Error executing $SCRIPT."
    exit 1
  fi
done

echo "All scripts executed successfully."
