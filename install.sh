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
    sudo snap install $1 $2
  else
    echo "Already installed: ${1}"
  fi
}

if [ $(dpkg-query -W -f='${Status}' google-chrome-stable 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt update
  apt_install google-chrome-stable
fi

apt_install curl
apt_install git
apt_install openvpn
apt_install tree
apt_install vim
apt_install wget
apt_install zsh
apt_install make
apt_install grub-customizer

snap_install discord
snap_install spotify
snap_install sublime-text --classic
snap_install goland --classic

# Oh My ZSH
if [ ! -f $HOME/.zshrc ]; then
  cp .zshrc $HOME/.zshrc
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
  sudo chsh -s "$(which zsh)" "${USER}"
fi