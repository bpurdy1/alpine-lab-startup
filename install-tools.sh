#!/bin/sh
set -e

echo "==> Installing general tools and container runtime..."
apk add --no-cache \
    curl \
    jq \
    vim \
    git \
    iptables \
    ip6tables \
    docker \
    docker-compose

# Enable the Docker daemon to start on boot
rc-update add docker default
service docker start
