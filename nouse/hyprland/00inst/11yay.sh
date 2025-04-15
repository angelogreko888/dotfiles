#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


if  pacman -Q yay &>/dev/null; then
	printf "\n\e[1;32m... yay is installed - quiting ...\e[0m\n"
	exit 0
  fi

cd ~

if ! [ -d git ]; then
        mkdir ~/git
fi

cd ~/git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

if ! pacman -Q yay &>/dev/null; then
       printf "\e[1;31mERROR...Sorry, could not install... yay\e[0m\n"
  fi
