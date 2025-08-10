#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(date | awk '{print $1}')
if [ $a == Sat ];then
	flag="/var/tmp/$(basename -- $0).flag"
	if [ -e "$flag" ] ;then
	[ $(date +%F) = $(date +%F -r "$flag") ] && exit 1
	fi
	touch "$flag"
                exec foot sh -c '
		printf "\n\e[1;32m....... update ....... \n\n\e[0m"  
		cd ~/dotnix/home
		nix flake update
		cd ~/dotnix/nix
#		nix flake update
#		nix-channel --update
		 sudo nix-channel --update nix flake update
		~/bin/switch.sh
		echo ~~~~~~~~~~~~~~~~Done!!!~~~~~~~~~~~~~~~~; cd ~;  read'
else
		if [ -f /var/tmp/update.sh.flag ]; then
		rm /var/tmp/trim.sh.flag 
		fi
fi
