#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

sleep 1

cd ~/dotfiles 

exec foot sh -c  'git pull; echo Done!!!; cd ~;  read'

