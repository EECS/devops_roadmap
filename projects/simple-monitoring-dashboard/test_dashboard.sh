#!/bin/bash

# Install `stress` on a new system

sudo apt update -y
sudo apt install stress -y

# Assuming that netdata is already installed, run stress to trigger a CPU usage alarm
stress --cpu 8 --timeout 60s

