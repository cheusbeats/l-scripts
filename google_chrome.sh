#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs Google Chrome browser
# Destination: This script will install Google Chrome package with apt

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

message 'Downloading Google Chrome ".deb"'
sudo apt install -qqy curl
curl -fLo "google-chrome-stable_current_amd64.deb" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

message 'Installing Google Chrome'
sudo apt install -yf ./google-chrome-stable_current_amd64.deb
