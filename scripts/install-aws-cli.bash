#!/bin/bash

INSTALL_DIR=${1}

DIR=$(mktemp -d)
pushd ${DIR}
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install --bin-dir ${INSTALL_DIR}/.local/bin/ --install-dir ${INSTALL_DIR}/.local/aws-cli/
popd
rm -rf ${DIR}