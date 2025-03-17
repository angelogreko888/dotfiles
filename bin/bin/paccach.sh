#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(date | awk '{print $1}')

if [ $a == Sat ];then
	paccache -ruk0
	paccache -rk1
	notify-send "paccache: pakages cleared !"
fi
