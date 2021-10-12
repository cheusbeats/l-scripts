#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs Google Chrome browser
# Destination: This script download Google Chrome Debian Package with curl

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Downloading Google Chrome ".rpm"'
curl -fLo "google-chrome-stable_current_x86_64.rpm" "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

message 'Installing Google Chrome, please wait'
sudo dnf install -y google-chrome-stable_current_x86_64.rpm
