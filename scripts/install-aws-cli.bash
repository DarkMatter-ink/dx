#!/bin/bash

DIR=$(mktemp -d)
pushd ${DIR}
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install --bin-dir /aws/bin/ --install-dir /aws/local/aws-cli/
rm awscliv2.zip
popd
rm -rf ${DIR}