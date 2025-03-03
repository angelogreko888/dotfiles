#!/usr/bin/env bash


for i in $(seq 1 99);
do
  sleep 900

  wget -q --spider http://google.com

  if [ $? -eq 0 ]; then
  cd  ~/.config/FreeTube/
  rsync history.db  ~/dotfiles/freetube/.config/FreeTube/history.db
  rsync playlists.db  ~/dotfiles/freetube/.config/FreeTube/playlists.db
  rsync profiles.db  ~/dotfiles/freetube/.config/FreeTube/profiles.db
  rsync search-history.db  ~/dotfiles/freetube/.config/FreeTube/search-history.db
  rsync settings.db  ~/dotfiles/freetube/.config/FreeTube/settings.db

  cd ~/dotfiles
  git add * && git commit -m "save" && git push -u origin main

else
    exit 1
fi

done
