#!/usr/bin/env bash

yay -Su --noconfirm -- needed brother-mfc-1910w

cd ~/Downloads

curl -O https://download.brother.com/welcome/dlf105191/brmfcfaxdrv-2.0.2-1.amd64.deb

dpkg -i --force-all brmfcfaxdrv-2.0.2-1.amd64.deb
