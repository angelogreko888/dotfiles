#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

source ~/dotfiles/00inst/aur.lst

cd ~

if ! [ -d git ]; then
        mkdir ~/git
fi

cd ~/git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

#cat ~/dotfiles/00inst/aur.lst | xargs yay -S --needed --noconfirm

for PKG in "${lst[@]}";do
        yay -Su --needed --noconfirm --needed --noconfirm "$PKG"
done
