#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(date | awk '{print $1}')

if [ $a == Fri ];then
	exec foot sh -c 'echo "paccash...git...";
	sudo paccache -ruk0;
	sudo paccache -rk1;
	cd ~/dotfiles;
	git cg;
	echo Done!!!; 
	sleep 3'
fi
