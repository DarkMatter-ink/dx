#!/bin/bash

INSTALL_DIR=${1}

PATH=${PATH}:${INSTALL_DIR}/.local/node/bin/ npm install -g aws-cdk
ln -s ${INSTALL_DIR}/.local/node/bin/cdk ${INSTALL_DIR}/.local/bin/