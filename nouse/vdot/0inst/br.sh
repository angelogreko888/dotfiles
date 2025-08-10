#!/bin/bash

sudo xbps-install \
brother-brlaser \
brother-brscan3 \
foomatic-db-engine \
cups-filters \
gutenprint \
system-config-printer  \
foomatic-db

cd ~/Downloads
curl -O https://download.brother.com/welcome/dlf105191/brmfcfaxdrv-2.0.2-1.amd64.deb
sudo dpkg -i --force-all brmfcfaxdrv-2.0.2-1.amd64.deb

sudo usermod -aG lpadmin vago
