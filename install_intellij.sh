#!/bin/sh

echo "Installing IntelliJ IDEA..."

# We need root to install
[ $(id -u) != "0" ] && exec sudo sh "$0" "$@"

# Attempt to install a JDK
# apt-get install openjdk-8-jdk
# add-apt-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer

# Prompt for edition
# while true; do
#     read -p "Enter 'U' for Ultimate or 'C' for Community: " ed
#     case $ed in
#         [Uu]* ) ed=U; break;;
#         [Cc]* ) ed=C; break;;
#     esac
# done

ed=C

# Fetch the most recent version
# VERSION=$(wget "https://www.jetbrains.com/intellij-repository/releases" -qO- | grep -P -o -m 1 "(?<=https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/idea/BUILD/)[^/]+(?=/)")

VERSION=2017.1.3

# Prepend base URL for download
URL="https://download.jetbrains.com/idea/ideaI$ed-$VERSION.tar.gz"

echo $URL

# Truncate filename
FILE=$(basename ${URL})

# Set download directory
DEST=~/Downloads/$FILE

echo "Downloading idea-I$ed-$VERSION to $DEST..."

# Download binary
wget -cO ${DEST} ${URL} --read-timeout=10 --tries=2

echo "Download complete!"

# Set directory name
DIR="/opt/idea-I$ed-$VERSION"

echo "Installing to $DIR"

# Untar file
if mkdir ${DIR}; then
    tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi

# Grab executable folder
BIN="$DIR/bin"

# Add permissions to install directory
chmod -R +rwx ${DIR}

# Set launcher shortcut path
LAUNCH=/usr/share/applications/IDEA.desktop

# Add launcher shortcut
echo "[Desktop Entry]\nEncoding=UTF-8\nName=IntelliJ IDEA\nComment=IntelliJ IDEA\nExec=${BIN}/idea.sh\nIcon=${BIN}/idea.png\nTerminal=false\nStartupNotify=true\nType=Application" -e > ${LAUNCH}

# Set desktop shortcut path
DESK=/home/cody/Desktop/IntellijC.desktop

# Add desktop shortcut
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=$DIR/bin/idea.png
Exec="$DIR/bin/idea.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea-ce" -e >  ${DESK}

# Make shortcut executable
chmod -R +rwx ${DESK}
chown cody ${DESK}
chgrp cody ${DESK}

# Create symlink entry
ln -sf ${BIN}/idea.sh /usr/local/bin/idea

echo "Intellij installation complete."
