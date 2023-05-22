#!/bin/bash

export DOCKER_PLATFORM=--platform="linux/$(uname -m)"
export DOCKER_PUSH=""

export REGISTRY=ghcr.io
export IMAGE_NAME="carnei-ro/kong-with-modsecurity"
export KONG_VERSION="3.3.0"
export KONG_WITH_MODSECURITY_IMAGE=${REGISTRY}/${IMAGE_NAME}:${KONG_VERSION}-ubuntu-$(uname -m)
export KONG_BUILD_TOOLS_VERSION="4.42.1"
export BUILDX='true'


git clone https://github.com/Kong/kong.git
cd kong
git checkout tags/$KONG_VERSION
cd ..

git clone https://github.com/Kong/kong-build-tools.git
cd kong-build-tools
git checkout tags/$KONG_BUILD_TOOLS_VERSION
cp ../kong-build-tools.patch .
patch -p1 < ./kong-build-tools.patch

make build-kong-image-with-modsecurity
