#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root. Use 'sudo'."
  exit 1
fi

# Print a welcome message and prompt for user input
echo "Hello, welcome! Let's open a port."
read -p "What port do you want to open? " PORT

# Validate port number input
if ! [[ "$PORT" =~ ^[0-9]+$ ]] || [ "$PORT" -lt 1 ] || [ "$PORT" -gt 65535 ]; then
  echo "Invalid port number. Please enter a number between 1 and 65535."
  exit 1
fi

# Prompt for protocol input
read -p "Do you want to open TCP or UDP? [tcp/udp]: " PROTOCOL
PROTOCOL=${PROTOCOL:-tcp}

# Validate the protocol
if [ "$PROTOCOL" != "tcp" ] && [ "$PROTOCOL" != "udp" ]; then
  echo "Invalid protocol. Use 'tcp' or 'udp'."
  exit 1
fi

# Allow the port using ufw
ufw allow "$PORT/$PROTOCOL"

# Check if the ufw command was successful
if [ $? -eq 0 ]; then
  echo "Port $PORT/$PROTOCOL has been allowed."
else
  echo "Failed to allow port $PORT/$PROTOCOL."
  exit 1
fi

# List all open ports
echo "Listing all open ports:"
ufw status
