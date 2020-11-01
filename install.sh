#!/bin/bash

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function apt_install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

function snap_install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt snap -y $1
  else
    echo "Already installed: ${1}"
  fi
}

apt_install curl
apt_install git
apt_install openvpn
apt_install tree
apt_install vim
apt_install wget
apt_install zsh
apt_install make
apt_install google-chrome-stable

snap_install discord
snap_install spotify
snap_install sublime-text
snap_install goland

# Change default shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"