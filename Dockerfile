FROM ubuntu:20.04

ARG USER_NAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER_NAME


RUN apt update && apt upgrade -y
RUN apt install build-essential gcc-arm-linux-gnueabihf git -y
RUN apt autoremove -y &&\
    apt clean &&\
    rm -rf /usr/local/src/*

WORKDIR /home
USER $USER_NAME