#!/bin/bash

DIR=$(mktemp -d)
pushd ${DIR}
curl -LO https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip -q aws-sam*.zip
./install --install-dir /aws/local/aws-sam/ --bin-dir /aws/bin/
popd
rm -rf ${DIR}