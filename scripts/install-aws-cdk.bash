#!/bin/bash

#TODO : Need to make this dynamic

TARGET="v18.15.0"

DIR=$(mktemp -d)
pushd ${DIR}
curl -L https://nodejs.org/dist/${TARGET}/node-${TARGET}-linux-x64.tar.xz -o target.tar.xz
mkdir -p /aws/local/node/
tar -xf target.tar.xz -C /aws/local/node --strip-components=1
ln -s /aws/local/node/bin/node /aws/bin
ln -s /aws/local/node/bin/npm /aws/bin

PATH=${PATH}:/aws/bin npm install -g aws-cdk
ln -s /aws/local/node/bin/cdk /aws/bin

popd
rm -rf ${DIR}