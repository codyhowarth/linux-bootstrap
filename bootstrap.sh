#!/bin/bash

# Standard installs
sudo apt-get update
# Disable upgrade for now since it's super slow
sudo apt-get -y upgrade
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install zsh
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install shellcheck

# Create git directory
mkdir ~/git

cd ~/git

git clone https://github.com/codyhowarth/linux-bootstrap

cd linux-bootstrap

sh install_java.sh

# The intellij version is hardcoded and needs to be modified when moving to
# a newer version
sh install_intellij.sh

sh install_pycharm.sh

sh install_atom.sh

sh install_chrome.sh

sh install_copyQ.sh

# Install powerline fonts
sh install_powerline_fonts.sh

# Setup git config
git config --global user.name "Cody Howarth"
git config --global user.email "codyhowarth@gmail.com"
git config --global core.editor "vim"

# Install oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Copy Dotfiles from git repo
echo "Copying dotfiles..."
cp -a ~/git/linux-bootstrap/dotfiles/. ~
echo "Done."

# Setup application autostart file...

# Install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

echo -e "\n\n Setup complete...changing shell over to zsh. Please restart.\nDon't forget to run ~/.dropbox-dist/dropboxd !"

# Change over to zsh
chsh -s /bin/zsh