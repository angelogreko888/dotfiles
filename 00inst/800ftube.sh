#!/usr/bin/env bash


if [ -d ~/.config/FreeTube ];then
	cd ~/.config/FreeTube
	rm history.db playlists.db profiles.db search-history.db settings.db
	cd ~/dotfiles/freetube/.config/FreeTube
	cp history.db playlists.db profiles.db search-history.db settings.db ~/.config/FreeTube
	echo "Done!"
else
	echo "freetube does not exist"
	exit 1
fi
