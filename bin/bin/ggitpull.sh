#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


until ping -c1 www.google.com &>/dev/null
do
sleep 2
done

  cd ~/dotfiles 
  git pull;
  
  cd ~/dotfiles/freetube/.config/FreeTube/;
  rsync history.db  ~/.config/FreeTube/history.db;
  rsync playlists.db  ~/.config/FreeTube/playlists.db;
  rsync profiles.db  ~/.config/FreeTube/profiles.db;
  rsync search-history.db  ~/.config/FreeTube/search-history.db;
  rsync settings.db  ~/.config/FreeTube/settings.db;
