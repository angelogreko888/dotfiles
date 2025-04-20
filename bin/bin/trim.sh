#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(date | awk '{print $1}')

if [ $a == Fri ];then
        if ! [ -f ~/.log/trim.log ]; then
                exec foot sh -c '
		printf "\n\e[1;32m....... trim....... \n\n\e[0m"  
                sudo fstrim -av;
                echo $(date) > ~/.log/trim.log;
                '
        fi
else
	if [ -f ~/.log/trim.log ]; then
		rm ~/.log/trim.log 
	fi
fi
