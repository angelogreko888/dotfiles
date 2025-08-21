#! /usr/bin/env bash

cd ~
git clone https://aur.archlinux.org/mmv.git
cd mmv/
makepkg -si --noconfirm
cd ~
rm -rf mmv
