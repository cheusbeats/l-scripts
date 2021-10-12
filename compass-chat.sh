#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs vim extensions
# Destination: This script will install required extensions for NeoVim (like plug.vim) and write some configuration in .vimrc

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Downloading Compass'
curl -fLo compass-linux.tar https://update.getcompass.com/apps/compass-linux.tar

message 'Install Compass'
sudo tar xf compass-linux.tar -C /opt/

message 'Get Compass icon'
curl -fLo compass-icon.svg https://getcompass.com/img/logo.ae73c79d.svg
sudo mv ./compass-icon.svg /opt/Compass/

message 'Creating a .desktop file for Compass'
cat <EOF >> /usr/local/share/applications/compass.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/opt/Compass/compass
Name=Compass
Comment=A chat app for business
Icon=/opt/Compass/compass-icon.svg
EOF

message 'Deleting downloaded files'
sudo rm -rf compass-linux.tar
