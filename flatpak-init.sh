#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Add Flatpak default repo
# Destination: This script will add Flatpak default source with flatpak app

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Adding new source for Flatpak'
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
