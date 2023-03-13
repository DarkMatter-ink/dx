#!/bin/bash

pushd /tmp/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install --bin-dir /aws/bin/ --install-dir /aws/local/aws-cli/
rm awscliv2.zip
popd

echo "PATH=${PATH}:/aws/bin" >> ${HOME}/.bashrc