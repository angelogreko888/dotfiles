#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

command cp $HOME/vago/pc/inst/pacman.lst  $HOME/dotfiles/misc/pacmanloq.lst

command cp $HOME/vago/pc/inst/aur.lst  $HOME/dotfiles/misc/aurloq.lst 
