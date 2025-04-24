#!/usr/bin/env bash

	cd  ~/.config/FreeTube/
	rsync history.db  ~/dotfiles/freetube/.config/FreeTube/history.db
	rsync playlists.db  ~/dotfiles/freetube/.config/FreeTube/playlists.db
	rsync profiles.db  ~/dotfiles/freetube/.config/FreeTube/profiles.db
	rsync search-history.db  ~/dotfiles/freetube/.config/FreeTube/search-history.db
	rsync settings.db  ~/dotfiles/freetube/.config/FreeTube/settings.db

	cd ~/dotfiles
	git status
