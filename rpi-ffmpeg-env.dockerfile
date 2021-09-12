FROM balenalib/raspberry-pi-debian:latest

MAINTAINER Nani Shin <nani.shin@gmail.com>

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 

RUN apt-get install -y --no-install-recommends \
    gcc \
    git \
    make \
    python3 \
    python3-pip \
    python3-setuptools \
    vim-tiny \
    libx264-dev \
    libraspberrypi-dev \
    libc6-dev
