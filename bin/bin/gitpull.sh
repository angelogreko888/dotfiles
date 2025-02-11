#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

sleep 1

cd ~/dotfiles 

exec foot sh -c  'git pull; echo Done!!!; cd ~/dotfiles/freetube/.config/FreeTube/;cp history.db playlists.db profiles.db search-history.db settings.db ~/.config/FreeTube; echo Copied!!!; cd ~;  read'

