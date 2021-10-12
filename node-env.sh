#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs node.js envinronment
# Destination: This script will install node.js, npm 

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

message 'Installing node env' 'Installing Node.js'
sudo dnf install -y nodejs &> /dev/null

message 'Installing node env' 'Installing npm'
sudo dnf install -y npm &> /dev/null
