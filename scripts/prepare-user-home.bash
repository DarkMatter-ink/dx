#!/bin/bash

TARGET=${1}

mkdir -p ${TARGET}/.local/bin
echo "PATH=${PATH}:${TARGET}/.local/bin" >> ${TARGET}/.bashrc