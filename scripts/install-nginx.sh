#!/bin/bash
# NGINX Installation Script

# Update package lists
sudo apt-get update -y

# Install NGINX
sudo apt-get install nginx -y

# Enable NGINX to start on boot
sudo systemctl enable nginx

# Start NGINX service
sudo systemctl start nginx

# Create a custom index.html with the hostname
HOSTNAME=$(hostname)
echo "<h1>Welcome to Enterprise Azure Infrastructure</h1><p>Server Hostname: <strong>${HOSTNAME}</strong></p>" | sudo tee /var/www/html/index.html
