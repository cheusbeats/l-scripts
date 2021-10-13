#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs fish with oh-my-fish framework
# Destination: This script will download oh-my-fish and install it with fish

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

message 'Installing fish'
sudo dnf install -y fish

message 'Installing fish' 'Install oh-my-fish'
curl -L https://get.oh-my.fish && exit | fish

message 'Post-install' 'Changing default shell to fish'
sudo dnf install -y util-linux-user
sudo chsh -s /usr/bin/fish
