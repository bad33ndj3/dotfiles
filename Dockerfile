FROM ubuntu:latest
ADD default-install /
RUN chmod +x /default-install
RUN apt-get update && apt-get -y install sudo
ENTRYPOINT /default-install