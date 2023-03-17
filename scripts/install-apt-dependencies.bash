#!/bin/bash

apt-get -qq update

apt-get -qq install -y \
  curl \
  wget \
  unzip \
  file \
  xz-utils \
  coreutils \
  git \
  sudo