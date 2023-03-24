#!/bin/bash

set -e

IMAGE_TARGET=$(basename -s .bash ${BASH_ARGV0})
case ${IMAGE_TARGET} in
"dx-cli") CONTAINER="ghcr.io/darkmatter-ink/dx-container:latest";;
"aws-cli") CONTAINER="ghcr.io/darkmatter-ink/aws-container:latest";;
esac

if [ ! -d "${HOME}/.aws" ]; then
    echo "AWS Configuration is missing, running configure..."
    mkdir -p ${HOME}/.awstmp/
    docker run --rm -it -v ${HOME}/.awstmp/:/aws/.aws/ --user "$(id -u):$(id -g)" ${CONTAINER} /bin/bash -c "ls -la /aws && ./bin/aws configure sso && exit"
    echo "Configure? : $?"
    mv ~/.awstmp ~/.aws
    echo "Done, rebooting"
fi

docker run --rm -it -v ${HOME}/.aws/:/aws/.aws --user "$(id -u):$(id -g)" ${CONTAINER} /bin/bash
