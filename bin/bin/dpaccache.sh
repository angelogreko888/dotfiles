#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR
/n
/n


	sudo paccache -ruk0
	sudo paccache -rk1
	sudo pacman -Scc --noconfirm
	yay -Scc --noconfirm
	yay -Yc --noconfirm
	a=$(pacman -Qdtq | wc -l) > /dev/null
	if [ $a -ne 0 ];then
	        sudo pacman -Rnsc $(pacman -Qdtq)
	else
		echo
	fi
