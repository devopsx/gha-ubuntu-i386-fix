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

    # wine pollutes the log with "wine: Read access denied for device" if z is linked to /
    if [[ "$INPUT_WINE_FIX_READ_ACCESS_DENIED" != 'false' ]]; then
        WINEDEBUG=-all wineboot
        z="$(readlink -f ~/.wine/dosdevices/z:)"
        if [[ "$z" == "/" ]]; then
            rm -f ~/.wine/dosdevices/z:
            ln -s /home ~/.wine/dosdevices/z:
        fi
    fi
fi
