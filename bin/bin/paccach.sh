#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(date | awk '{print $1}')

if [ $a == Fri ];then
	exec foot sh -c '
	printf "\n\e[1;32m.......clean paccache? : \n\e[0m"
	select yn in yes no;do
	case $yn in
	yes)
		sudo paccache -ruk0;
		sudo paccache -rk1;
		sleep 3
		break ;;
	no)
		exit 0
		break ;;
	esac
done'
fi
