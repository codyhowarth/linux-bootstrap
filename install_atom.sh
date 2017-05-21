#!/bin/bash

echo "Installing atom..."

sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install atom

apm install --packages-file dotfiles/packages.list

echo "Atom installation complete."

# Get and install atom (without repo)
# wget https://atom.io/download/deb -O ~/Downloads/atom.deb && sudo dpkg -i ~/Downloads/atom.deb
