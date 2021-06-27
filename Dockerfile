FROM ubuntu:latest
ADD default-install /
RUN apt-get update && apt-get -y install sudo wget
ENTRYPOINT wget -O - https://raw.githubusercontent.com/bad33ndj3/dotfiles/master/default-install | bash
