#!/bin/bash

apt-get -q update

apt-get -q install -y \
  curl \
  wget \
  unzip \
  file \
  xz-utils \
  coreutils \
  git \
  sudo