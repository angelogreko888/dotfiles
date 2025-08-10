#!/bin/bash

sudo xbps-install git nano

mkdir -p ~/git/vp
cd ~/git/vp
git clone https://github.com/void-linux/void-packages.git
cd ~/git/vp/void-packages
./xbps-src binary-bootstrap
