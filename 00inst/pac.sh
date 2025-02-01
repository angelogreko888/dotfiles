#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

cat ~/dotfiles/00int/bpac | xargs sudo pacman -S --needed --noconfirm
