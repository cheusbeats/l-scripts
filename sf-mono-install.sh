#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs San Francisco Fonts
# Destination: This script will install SF Mono in /usr/share/fonts

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Clone github repo'
sudo dnf install -y git
git clone https://github.com/supercomputra/SF-Mono-Font.git

message 'Install fonts in /usr/local/share/fonts/'
sudo mkdir -p /usr/local/share/fonts
sudo cp ./SF-Mono-Font/* /usr/local/share/fonts/

message 'Remove cloned repo'
rm -rf ./SF-Mono-Font

message 'Update Font Cache'
sudo fc-cache -fv
