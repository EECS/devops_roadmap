#!/bin/bash

echo "Uninstalling dummy systemd service..."
sleep 1

# Stop the dummy systemd service
sudo systemctl stop dummy

# Remove the dummy.sh script from /usr/bin/dummy/
sudo rm /usr/bin/dummy/dummy.sh

# Remove the dummy.service file from /etc/systemd/system/
sudo rm /etc/systemd/system/dummy.service

# Remove the generated log file
sudo rm /var/log/dummy-service.log

# Reload systemd to read service files
sudo systemctl daemon-reload

echo "Dummy systemd service uninstalled successfully!"