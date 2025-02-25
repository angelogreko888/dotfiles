#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

source ~/dotfiles/00inst/pac.lst

cd ~


for PKG in "${lst[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done

for PKG in "${lst[@]}";do
	if sudo pacman -Q "$PKG" &>/dev/null; then
        echo "OK...$PKG"
    else
        echo "[ ERROR ] - Sorry, could not install $PKG!"
    fi
done
