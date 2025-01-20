#!/usr/bin/env bash

if [ -d ~/.config/FreeTube ];then
	cd ~/.config/FreeTube
	rm history.db playlists.db profiles.db settings.db
	cd ~/dotfiles
	stow freetube
	echo "Done!"
else
	echo "freetube does not exist"
	exit 1
fi
