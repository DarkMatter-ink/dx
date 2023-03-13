#!/bin/bash

set -e

if [ ! -d "${HOME}/.aws" ]; then
    echo "AWS Configuration is missing, running configure..."
    mkdir -p ${HOME}/.awstmp/
    docker run --rm -it -v ${HOME}/.awstmp/:/aws/.aws/ --user "$(id -u):$(id -g)" aws-container /bin/bash -c "ls -la /aws && ./bin/aws configure sso && exit"
    echo "Configure? : $?"
    mv ~/.awstmp ~/.aws
    echo "Done, rebooting"
fi

docker run --rm -it -v ${HOME}/.aws/:/aws/.aws --user "$(id -u):$(id -g)" aws-container /bin/bash