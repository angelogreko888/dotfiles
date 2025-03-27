#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(date | awk '{print $1}')

if [ $a == Fri ];then
	exec foot sh -c sudo paccache -ruk0;
	sudo paccache -rk1;
#	notify-send "paccache: pakages cleared !"
	echo Done!!!; cd ~;  read'
fi
