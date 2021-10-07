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
sudo dnf remove -y docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-selinux \
  docker-engine-selinux \
  docker-engine

message 'Adding Docker repositories to local list'
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
  --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

message 'Installing Docker on the machine'
sudo dnf install -y docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose

message 'Starting Docker services'
sudo systemctl enable --now docker

message 'Post-installation steps'
sudo groupadd docker # Adding new group
sudo usermod -aG docker $USER # Adding current user to the group
newgrp docker # Activate privileges
