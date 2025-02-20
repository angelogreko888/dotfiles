#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~/Downloads

#sudo pacman -Su dpkg

#yay -Su --noconfirm -- needed brother-mfc-1910w

curl -O https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.4-1.gz

gunzip linux-brprinter-installer-2.2.4-1.gz 

sudo bash linux-brprinter-installer-2.2.4-1

curl -O https://download.brother.com/welcome/dlf105191/brmfcfaxdrv-2.0.2-1.amd64.deb

#sudo dpkg -i --force-all brmfcfaxdrv-2.0.2-1.amd64.deb

#rm *

