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

  exec foot sh -c  'git pull;
  cd ~/dotfiles/freetube/.config/FreeTube/;
  rsync history.db  ~/.config/FreeTube/history.db;
  rsync playlists.db  ~/.config/FreeTube/playlists.db;
  rsync profiles.db  ~/.config/FreeTube/profiles.db;
  rsync search-history.db  ~/.config/FreeTube/search-history.db;
  rsync settings.db  ~/.config/FreeTube/settings.db;
  cd ~/dotfiles/nouse/brows/;
  rsync -r --exclude 'lock' .mullvad  ~/;
  rsync -r --exclude 'lock' .librewolf  ~/;
  echo Done!!!; cd ~;  read'
