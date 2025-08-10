#!/usr/bin/env bash

  wget -q --spider http://google.com

  if [ $? -eq 0 ]; then
	cd  ~/.config/FreeTube/
	rsync history.db  ~/dotfiles/freetube/.config/FreeTube/history.db
	rsync playlists.db  ~/dotfiles/freetube/.config/FreeTube/playlists.db
	rsync profiles.db  ~/dotfiles/freetube/.config/FreeTube/profiles.db
	rsync search-history.db  ~/dotfiles/freetube/.config/FreeTube/search-history.db
	rsync settings.db  ~/dotfiles/freetube/.config/FreeTube/settings.db

	cd ~/dotfiles
	git add . && git commit -m "save" && git push -u origin main

  else
  echo exit
  fi
