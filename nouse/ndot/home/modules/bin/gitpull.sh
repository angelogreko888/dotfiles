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

until ping -c1 www.google.com &>/dev/null
do
sleep 2
done

exec foot sh -c '
  cd ~/ndot;
# git fetch origin;
 git pull;
  cd ~/ndot/home/modules/freetube;
  rsync history.db  ~/.config/FreeTube/history.db;
  rsync playlists.db  ~/.config/FreeTube/playlists.db;
  rsync profiles.db  ~/.config/FreeTube/profiles.db;
  rsync search-history.db  ~/.config/FreeTube/search-history.db;
  rsync settings.db  ~/.config/FreeTube/settings.db;
if [ $? -ne 0 ];then
  bash ~/bin/switch.sh;
echo
else
echo 
fi
echo ~~~~~~~~~~~~~~~~Done!!!~~~~~~~~~~~~~~~~; cd ~;  read'
