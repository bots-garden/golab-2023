#!/bin/bash
MINISM_VERSION="0.0.1"
MINISM_ARCH="arm64"
wget https://github.com/bots-garden/minism/releases/download/v${MINISM_VERSION}/minism-v${MINISM_VERSION}-linux-${MINISM_ARCH}
cp minism-v${MINISM_VERSION}-linux-${MINISM_ARCH} minism
chmod +x minism
rm minism-v${MINISM_VERSION}-linux-${MINISM_ARCH}
sudo cp ./minism /usr/bin
rm minism
minism version