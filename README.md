# dotfiles

A short documentation on how to customise linux, this seemed like the best idea after the 4th complete reinstall!

### Update Ubuntu and get standard repository programs
    $ sudo apt update && sudo apt full-upgrade -y

### Install standard apt packages
    $ sudo apt install -y curl git openvpn tree vim wget zsh make grub-customizer

### Snap packages
    $ sudo snap install discord spotify
    $ sudo snap install --classic sublime-text && sudo snap install --classic goland

### Chrome from source
    $ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    $ echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    $ sudo apt update
    $ sudo apt install google-chrome-stable

### Install the zshrc trough oh-my-zsh
    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Set zsh as default shell (log out to complete)
    $ sudo chsh -s "$(which zsh)" "${USER}"
    
# Docs
- [golang](docs/golang.md)
