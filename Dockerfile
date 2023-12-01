FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG USER_NAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER_NAME


RUN apt update && apt upgrade -y
RUN apt install build-essential gcc-arm-linux-gnueabihf crossbuild-essential-armhf -y
RUN apt install git bc bison flex libssl-dev make libc6-dev libncurses5-dev -y
RUN apt autoremove -y &&\
    apt clean &&\
    rm -rf /usr/local/src/*

WORKDIR /home
USER $USER_NAME