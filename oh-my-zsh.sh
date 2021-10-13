#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs zsh with oh-my-zshframework
# Destination: This script will download oh-my-zsh and install it with zsh

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

message 'Installing zsh'
sudo dnf install -y zsh

message 'Installing zsh' 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && exit)"

message 'Post-install' 'Changing default shell to zsh'
sudo dnf install -y util-linux-user
sudo chsh -s /usr/bin/zsh
