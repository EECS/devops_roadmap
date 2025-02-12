#!/bin/bash

# This script is used to deploy a static site to a Digital Ocean droplet

while getopts "i:p:u:" opt; do
    case ${opt} in
    u ) # Handle -u flag
        user=$OPTARG
        ;;
    i ) # Handle -i flag with an argument
        ip=$OPTARG
        ;;
    p ) # Handle -p flag with an argument
        path=$OPTARG
        ;;
    \? ) # Handle invalid flags
        echo "Usage: $0 [-i ip address of server] [-p path to site] [-u user]"
        exit 1
        ;;
        # Handle missing arguments
    : )
        echo "Invalid option: $OPTARG requires an argument"
        ;;
  esac
done

# Check if the ip and path are set
if [ -z "$ip" ] || [ -z "$path" ] || [ -z "$user" ]; then
    echo "Usage: $0 [-i ip address of server] [-p path to site] [-u user]"
    exit 1
fi

# Deploy the site
rsync -avz $path $user@$ip:/var/www/html/

# Restart the server
ssh $user@$ip  'systemctl restart nginx'