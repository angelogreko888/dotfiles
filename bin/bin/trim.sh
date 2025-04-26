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
	[ $(date +%F) = $(date +%F -r "$flag") ] && exit 0
	fi
	touch "$flag"
	exec foot sh -c '
	printf "\n\e[1;32m....... pacache ..... trim ....... \n\n\e[0m";
	sudo paccache -ruk0
	sudo paccache -rk1
	sudo pacman -Scc --noconfirm
	yay -Scc --noconfirm
	yay -Yc --noconfirm
	a="$((pacman -Qdtq) | wc -l >/dev/null)" > /dev/null
	if [ $a > 0 ];then
	        sudo pacman -Rnsc $(pacman -Qdtq)
	else
		echo
	fi
	sudo fstrim -av;'
else
	if [ -f /var/tmp/trim.sh.flag ]; then
	rm /var/tmp/trim.sh.flag 
	fi
fi
