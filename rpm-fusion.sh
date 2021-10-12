#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Set up RPM Fusion on Fedora
# Destination: This script will set up RPM Fusion's repo

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Install RPM Fusion'
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
