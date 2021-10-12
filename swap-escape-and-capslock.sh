#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Swap Caps Lock key with Escape key
# Destination: This script will keys with gsettings or with xcaps (working on Gnome and KDE only)

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Swapping Caps Lock and Escape'
if [[ $XDG_CURRENT_DESKTOP = "GNOME" ]]; then
	message 'Swapping keys on GNOME'
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
fi
