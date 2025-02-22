#!/bin/bash

echo "Installing dummy systemd service..."
sleep 1

# Make the dummy.sh script executable
sudo chmod +x dummy.sh

# Copy the dummy.sh script to /usr/bin/dummy/ if 
# the directory does not exist
if [ ! -d /usr/bin/dummy/ ]; then
    sudo mkdir /usr/bin/dummy/
fi
sudo cp dummy.sh /usr/bin/dummy/

# Copy the dummy.service file to /etc/systemd/system/
sudo cp dummy.service /etc/systemd/system/

# Reload systemd to read the new service file
sudo systemctl daemon-reload

echo "Dummy systemd service installed successfully!"