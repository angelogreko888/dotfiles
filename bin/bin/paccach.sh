#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(date | awk '{print $1}')

if [ $a == Fri ];then
	exec foot sh -c 'echo "paccash....";
	sudo paccache -ruk0;
	sudo paccache -rk1;
	sleep 3'
fi
