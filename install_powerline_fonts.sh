#!/bin/bash

echo "Installing powerline fonts..."

cd ~/git
git clone https://github.com/powerline/fonts

cd fonts

sh install.sh

fc-cache -vf

echo "Installation of powerline fonts complete."
