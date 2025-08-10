#!/bin/bash

mkdir ~/git
cd ~/git
echo repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc | sudo tee /etc/xbps.d/hyprland-void.conf
sudo xbps-install -S

cd ~

lst=($(cat ~/vdot/0inst/phl.lst))

for PKG in "${lst[@]}";do
        sudo xbps-install -Ay "$PKG"
done
