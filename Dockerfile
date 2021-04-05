FROM python:3.7-slim-buster

################################################################################
## setup container
################################################################################
RUN apt update

# The Firebase install scripts use sudo so we need to add it.
RUN apt install -y sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
RUN sudo apt update
RUN sudo apt install -y curl
# Install base tools
RUN curl -sL firebase.tools | bash

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
RUN sudo apt install -y nodejs
