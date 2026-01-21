#!/bin/bash

echo "Updating package lists..."
sudo apt-get update

# Install Nginx
echo "Installing Nginx..."

sudo apt-get install -y nginx

# Start Nginx service
echo "Starting Nginx service..."

sudo systemctl start nginx
sudo systemctl enable nginx

# simple website setup

echo "Setting up a simple website..."

echo "<h1>Success! Nginx is installed and running.</h1>" | sudo tee /var/www/html/index.html

echo "Nginx installation and setup complete."



