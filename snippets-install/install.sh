#!/bin/bash
SNIPPETS_VERSION="0.0.1"
SNIPPETS_OS="linux" # or darwin
SNIPPETS_ARCH="arm64" # or amd64
wget https://github.com/bots-garden/snippets/releases/download/v${SNIPPETS_VERSION}/snippets-v${SNIPPETS_VERSION}-${SNIPPETS_OS}-${SNIPPETS_ARCH}
cp snippets-v${SNIPPETS_VERSION}-${SNIPPETS_OS}-${SNIPPETS_ARCH} snippets
chmod +x snippets
rm snippets-v${SNIPPETS_VERSION}-${SNIPPETS_OS}-${SNIPPETS_ARCH}
sudo cp ./snippets /usr/bin
rm snippets
# check the version
snippets version