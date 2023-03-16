#!/bin/bash

INSTALL_DIR=${1}

DIR=$(mktemp -d)
pushd ${DIR}
curl -LO https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip -q aws-sam*.zip
./install --install-dir ${INSTALL_DIR}/.local/aws-sam/ --bin-dir ${INSTALL_DIR}/.local/bin/
popd
rm -rf ${DIR}