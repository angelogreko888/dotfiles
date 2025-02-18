#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

sudo pacman -Su dpkg

yay -Su --noconfirm -- needed brother-mfc-1910w

curl -O https://download.brother.com/welcome/dlf105191/brmfcfaxdrv-2.0.2-1.amd64.deb

dpkg -i --force-all brmfcfaxdrv-2.0.2-1.amd64.deb

rm brmfcfaxdrv-2.0.2-1.amd64.deb

