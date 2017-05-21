#!/bin/bash

echo "Installing Pycharm community..."

sudo add-apt-repository -y ppa:mystic-mirage/pycharm
sudo apt-get update
sudo apt-get -y install pycharm-community

# Set desktop shortcut path
DESK=/home/cody/Desktop/PyCharm.desktop

# Add desktop shortcut
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=pycharm-community
Exec=pycharm-community %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce" -e >  ${DESK}

# Make shortcut executable
chmod -R +rwx ${DESK}
chown cody ${DESK}
chgrp cody ${DESK}

echo "Pycharm installation complete!."
