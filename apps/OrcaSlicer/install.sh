#!/bin/bash

# Check if running on Ubuntu
if [ -z "$selected_distro" ]; then
    echo "$selected_distro"
    if [ "$ID" = "ubuntu" ] || [ "$ID_LIKE" = "ubuntu" ]; then
        echo "Running on Ubuntu, proceeding with installation..."
    else
        echo "This application is only supported on Ubuntu!"
        exit 1
    fi
else
    echo "Cannot determine the distribution. Installation aborted."
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
