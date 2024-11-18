#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


pac="$HOME/vago/pc/inst/pacman.lst"
aur="$HOME/vago/pc/inst/aur.lst"

dpac="$HOME/dotfiles/misc/$1pacman.lst"
daur="$HOME/dotfiles/misc/$1aur.lst"

ccp() {
	command cp $pac $dpac
	command cp $aur $daur
}
 
case $1 in
        q) ccp ;;
        l) ccp ;;
        d) ccp ;;
        *) echo "enter a laptop name" && exit 0 ;;
esac
