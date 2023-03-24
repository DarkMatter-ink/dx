#!/bin/bash

GO_VER=https://go.dev/dl/go1.20.2.linux-amd64.tar.gz

DIR=$(mktemp -d)
pushd ${DIR}
curl -LO ${GO_VER}
pushd ${HOME}/.local/
tar -zxvf ${DIR}/$(basename ${GO_VER})
ln -s $(pwd)/go/bin/* bin/
popd
popd
rm -rf ${DIR}
