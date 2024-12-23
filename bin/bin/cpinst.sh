#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


case $1 in
        q)  ;;
        l)  ;;
        d)  ;;
        *) echo "enter a laptop name" && exit 0 ;;
esac

pacman -Qqe | grep -v "$(pacman -Qqm)" > $HOME/dotfiles/misc/$1pacman.lst

pacman -Qqm > $HOME/dotfiles/misc/$1aur.lst

