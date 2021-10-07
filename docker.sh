#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs Docker Engine on Fedora
# Destination: This script will add Docker repository to local list of repositories and install docker-ce, docker-ce-cli containerd.io packages

# Function for output messages
function message() {
  # Green bold text
  echo -e '\033[1;32m'$1'\033[0m'
}

message 'Removing old Docker instances'
sudo apt remove -y docker \
  docker-engine \
  docker.io \
  containerd \
  runc

message 'Adding Docker repositories to local list'
sudo apt update
sudo apt install -y apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

message 'Installing Docker on the machine'
sudo apt-get update
sudo apt-get install -y docker-ce \
  docker-ce-cli \
  containerd.io

message 'Starting Docker services'
sudo systemctl enable --now docker

message 'Post-installation steps'
sudo groupadd docker # Adding new group
sudo usermod -aG docker $USER # Adding current user to the group
newgrp docker # Activate privileges
