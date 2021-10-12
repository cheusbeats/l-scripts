#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs vim extensions
# Destination: This script will install required extensions for NeoVim (like plug.vim) and write some configuration in .vimrc

# Function for output messages
function message() {
	if ! [[ $2 ]]; then
		# Green bold text
		echo -e '\033[1;32m'$1'\033[0m'
	else
		# Green, red and blue text
		echo -e '\033[1;32m'$1'\033[1;31m >> \033[1;34m'$2'\033[0m'
	fi
}

message 'Downloading Compass'
curl -fLo compass-linux.tar https://update.getcompass.com/apps/compass-linux.tar

message 'Install Compass'
sudo tar xf compass-linux.tar -C /opt/

message 'Install Compass' 'Get and set Compass icon'
curl -fLo compass-icon.svg https://getcompass.com/img/logo.ae73c79d.svg
sudo mv ./compass-icon.svg /opt/Compass/

message 'Install Compass' 'Creating a .desktop file for Compass'
sudo tee /usr/share/applications/compass.desktop <<EOF > /dev/null
[Desktop Entry]
Version=1.0
Name=Compass
GenericName=Compass
Comment=A chat app for business
Type=Application
Exec=/opt/Compass/Compass
Icon=/opt/Compass/compass-icon.svg
Terminal=false
StartupNotify=false
Categories=Application;Messanger;
Keywords=business;compass;chat;messanger;
EOF
sudo cp /usr/{,local}/share/applications/compass.desktop

message 'Deleting downloaded files'
sudo rm -rf compass-linux.tar
