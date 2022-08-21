#!/bin/bash

set -xeu -o pipefail

if ! grep "20.04" /etc/issue; then
  echo "Not Ubuntu 20.04, pass"
  exit 0
fi

sudo apt-add-repository -y ppa:ondrej/php
sudo apt-get install ppa-purge
sudo ppa-purge -y ppa:ondrej/php
