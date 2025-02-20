#!/bin/bash

# Remove netdata from the system

sudo apt remove netdata -y
sudo apt purge netdata -y
sudo apt autoremove -y