#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs Sublime Text
# Destination: This script will import GPG keys for Sublime Text and install it

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

message 'Installing Sublime Text' 'Importing gpg keys'
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

message 'Installing Sublime Text' 'Adding Sublime Text repo'
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


message 'Installing Sublime Text' 'Installing Sublime Text'
sudo dnf install -y sublime-text
