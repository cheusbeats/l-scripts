#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Configure sudo for using without password
# Destination: This script will make a directory in /etc/sudoers.d with username file and write into this file rule, that will tell sudo not check password for current user

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

message '' "Warning! Don't do this in production. You are doing this on your own risk!"

echo "Are you sure? [y/N]"
read -sn1 response

case "$response" in
	[yY][eE][sS]|[yY]) 
		message 'Setting up a new rule for sudo'
		echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
		;;
esac
