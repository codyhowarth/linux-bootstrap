#!/bin/bash

echo "Installing CopyQ..."
sudo add-apt-repository -y ppa:hluk/copyq
sudo apt update
sudo apt install -y copyq

# Add to automatically started programs
sudo cp /usr/share/applications/copyq.desktop /etc/xdg/autostart
echo "CopyQ installation complete."
