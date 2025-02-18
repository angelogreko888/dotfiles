#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

source ~/dotfiles/00inst/pac.lst

cd ~

#cat ~/dotfiles/00inst/pac.lst | xargs sudo pacman -S --needed --noconfirm

for PKG in "${lst[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done
