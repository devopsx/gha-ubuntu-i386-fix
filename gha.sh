#!/bin/bash

set -xeu -o pipefail

if ! grep "Ubuntu" /etc/issue; then
  echo "Not Ubuntu, pass"
  exit 0
fi

sudo rm -f /etc/apt/sources.list.d/microsoft-prod.list
sudo eatmydata dpkg --add-architecture i386
sudo eatmydata apt-get update -qq

if [[ "$INPUT_INSTALL_WINE" != 'false' ]]; then
  sudo DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -yqq --allow-downgrades libc6:i386 libgcc-s1:i386 libstdc++6:i386 wine
fi
