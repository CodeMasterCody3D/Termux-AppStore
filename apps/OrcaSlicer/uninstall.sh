#!/bin/bash

# Check if running on Ubuntu
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ] || [ "$ID_LIKE" = "ubuntu" ]; then
        echo "Running on Ubuntu, proceeding with uninstallation..."
    else
        echo "This application is only supported on Ubuntu!"
        exit 1
    fi
else
    echo "Cannot determine the distribution. Uninstallation aborted."
    exit 1
fi

# Uninstall OrcaSlicer
pdrun sudo apt remove -y orcaslicer
pdrun sudo apt autoremove -y

echo "OrcaSlicer has been uninstalled."
