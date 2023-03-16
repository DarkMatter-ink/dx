#!/bin/bash

#TODO : Need to make this dynamic
INSTALL_DIR=${1}
TARGET="v18.15.0"

DIR=$(mktemp -d)
pushd ${DIR}
curl -L https://nodejs.org/dist/${TARGET}/node-${TARGET}-linux-x64.tar.xz -o target.tar.xz
mkdir -p ${INSTALL_DIR}/.local/node/
tar -xf target.tar.xz -C ${INSTALL_DIR}/.local/node --strip-components=1
# This leverages `env` so we need path to be set to find "node"
PATH=${PATH}:${INSTALL_DIR}/.local/node/bin/ npm install -g npm@latest

ln -s ${INSTALL_DIR}/.local/node/bin/* ${INSTALL_DIR}/.local/bin/

popd
rm -rf ${DIR}