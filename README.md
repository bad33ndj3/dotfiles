# dotfiles

Helper repo for my linux packages and software

    $ https://raw.githubusercontent.com/bad33ndj3/dotfiles/master/default-install | bash

### Update Ubuntu
    $ sudo apt update && sudo apt full-upgrade -y

### Install standard apt packages
    $ sudo apt install -y curl git openvpn tree vim wget zsh make

### Snap packages
    $ sudo snap install discord spotify
    $ sudo snap install --classic sublime-text

### Chrome
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $ sudo apt install ./google-chrome-stable_current_amd64.deb

### Install the zshrc trough oh-my-zsh
    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Set zsh as default shell (log out to complete)
    $ sudo chsh -s "$(which zsh)" "${USER}"
Logout afterward.
    
For autocomple [go here](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
    
# Docs
- [golang](docs/golang.md)
