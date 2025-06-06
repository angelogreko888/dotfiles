#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

flag="/var/tmp/$(basename -- $0).flag"

if [ -e "$flag" ] ;then
	[ $(date +%F) = $(date +%F -r "$flag") ] && exit 1
fi
touch "$flag"

while (true); do
	sleep 600
	cd  ~/.config/FreeTube/
	rsync history.db  ~/dotfiles/freetube/.config/FreeTube/history.db
	rsync playlists.db  ~/dotfiles/freetube/.config/FreeTube/playlists.db
	rsync profiles.db  ~/dotfiles/freetube/.config/FreeTube/profiles.db
	rsync search-history.db  ~/dotfiles/freetube/.config/FreeTube/search-history.db
	rsync settings.db  ~/dotfiles/freetube/.config/FreeTube/settings.db

	cd ~/dotfiles
	a=$(git status | wc -l) > /dev/null
	if [ $a -ne 4 ];then
	       	wget -q --spider http://google.com > /dev/null
        	if [ $? -eq 0 ]; then
		        git add . && git commit -m "save" && git push -u origin main
			notify-send --hint int:transient:1 " dotfiles synchronized "
	        fi
	else
		echo
	fi
done

