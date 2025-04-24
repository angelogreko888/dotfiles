#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(date | awk '{print $1}')
if [ $a == Fri ];then
	flag="/var/tmp/$(basename -- $0).flag"
	if [ -e "$flag" ] ;then
	[ $(date +%F) = $(date +%F -r "$flag") ] && exit 1
	fi
	touch "$flag"
                exec foot sh -c '
		printf "\n\e[1;32m....... trim....... \n\n\e[0m"  
                sudo fstrim -av;'
else
		if [ -f ~/var/tmp/trim.sh.flag ]; then
		rm ~/var/tmp/trim.sh.flag 
		fi
fi
