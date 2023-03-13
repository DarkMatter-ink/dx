#!/bin/bash

set -e

if [ ! -d "${HOME}/.aws/" ]; then
    echo "AWS Configuration is missing, running configure..."
    docker run --rm -it -v ${HOME}/.awstmp/:/root/.aws/ aws-container /bin/bash -c "./bin/aws configure sso --profile SSO"
    echo "Configure? : $?"
    mv ~/.awstmp/ ~/.aws/
fi

docker run --rm -it --read-only ${HOME}/.aws/ aws-container /bin/bash