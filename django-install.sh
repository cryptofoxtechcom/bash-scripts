#!/bin/bash

# Version: 1.01
# Author: Cryptofox 
# Description: A script that installs django into an ubuntu server.
# Usage: ./django-install.sh

# Changelog:
# Version 1.0 - [2023-07-21]: Initial release
# Version 1.01 - [2023-07-21]: Added ALLOWED_HOSTS

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Python and pip
echo "Installing Python and pip..."
sudo apt-get install -y python3 python3-pip

# Install Django and its dependencies
echo "Installing Django and its dependencies..."
pip3 install django

# Check and list versions
echo "Checking versions..."
python3 --version
pip3 --version
django-admin --version

# Prompt for Django project name
read -p "Enter the name of your Django project: " project_name

# Create Django project
echo "Creating Django project: $project_name..."
django-admin startproject $project_name

# Navigate to the project directory
cd $project_name

# Get the server's IP address
server_ip=$(hostname -I | awk '{print $1}')

# Update ALLOWED_HOSTS in settings.py
echo "Updating ALLOWED_HOSTS in settings.py..."
sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['$server_ip', 'localhost', '127.0.0.1'\]/" $project_name/settings.py

# Start the Django development server
echo "Starting Django development server..."
python3 manage.py runserver 0.0.0.0:8000 &

# Wait for the server to start
sleep 7

# Test the server by curling to localhost
echo "Running a quick test by curling to localhost..."
curl -s http://localhost:8000

# Check if the curl command was successful
if [ $? -eq 0 ]; then
    echo "The Django server is running successfully!"
else
    echo "There was an issue starting the Django server."
fi

# Echo out that the process is done
echo "Process completed successfully!"

exit