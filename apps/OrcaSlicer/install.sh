#!/bin/bash

# Get OS details inside PRoot
OS_INFO=$(pdrun cat /etc/os-release)
ID=$(echo "$OS_INFO" | grep '^ID=' | cut -d= -f2 | tr -d '"')
ID_LIKE=$(echo "$OS_INFO" | grep '^ID_LIKE=' | cut -d= -f2 | tr -d '"')

# Check if running on Ubuntu
if [[ "$ID" == "ubuntu" || "$ID_LIKE" == "ubuntu" ]]; then
    echo "Running on Ubuntu, proceeding with installation..."
else
    echo "This application is only supported on Ubuntu!"
    exit 1
fi

# Update package list
pdrun sudo apt update

# Download and run the OrcaSlicer installer
wget -O install-orca-ubuntu.sh https://github.com/CodeMasterCody3D/OrcaSlicer/releases/download/arm64/install-orca-ubuntu.sh
chmod +x install-orca-ubuntu.sh
./install-orca-ubuntu.sh

# Clean up
rm install-orca-ubuntu.sh

echo "OrcaSlicer installation completed!"
