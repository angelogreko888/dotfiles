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

git clone  https://github.com/Frogging-Family/nvidia-all.git
cd  nvidia-all/
makepkg -si 
