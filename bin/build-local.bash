#!/bin/bash -e

docker build -f Dockerfile -t ghcr.io/darkmatter-ink/aws-container:local . --progress=plain
docker build -f Dockerfile.dev -t ghcr.io/darkmatter-ink/dx-container:local . --progress=plain