#!/bin/bash

# Take in argument
if [ -z "$1" ]; then
  echo "Please provide a name to log"
  exit 1
fi

echo "Hello $1"