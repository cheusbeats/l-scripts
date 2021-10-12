#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs Sublime Merge
# Destination: This script will download GPG keys for Sublime merge and install it

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

message 'Importing gpg keys'
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

message 'Installing Sublime Merge' 'Adding Sublime Merge to the local repos'
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

message 'Installing Sublime Merge' 'Installing'
sudo dnf install -y sublime-merge
