#!/bin/bash

set -xeu -o pipefail

if ! grep "Ubuntu" /etc/issue; then
  echo "Not Ubuntu, pass"
  exit 0
fi

sudo eatmydata apt-get install ppa-purge
sudo eatmydata ppa-purge -y ppa:ubuntu-toolchain-r/test
sudo eatmydata  dpkg --add-architecture i386
sudo eatmydata  apt -qq update

if [[ "$INPUT_INSTALL_WINE" != 'false' ]]; then
  sudo DEBIAN_FRONTEND=noninteractive eatmydata apt install -y --no-install-recommends wine-stable wine32
fi
