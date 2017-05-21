#!/bin/bash

# Taken from: https://askubuntu.com/questions/510056/how-to-install-google-chrome/510063

echo "Installing Chrome..."

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update

sudo apt-get -y install google-chrome-stable

# Set desktop shortcut path
DESK=/home/cody/Desktop/Chrome.desktop

# Add desktop shortcut
echo "[Desktop Entry]
Version=1.0
Name=Google Chrome
Comment=Access the Internet
Exec=/usr/bin/google-chrome-stable %U
Terminal=false
Icon=google-chrome
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;" -e >  ${DESK}

# Make shortcut executable
chmod -R +rwx ${DESK}
chown cody ${DESK}
chgrp cody ${DESK}

echo "Chrome installation complete."
