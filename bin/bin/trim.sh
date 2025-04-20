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
		 printf "\n\e[1;32m....... trim....... \n\e[0m"  
                sudo fstrim -av;
                echo date > ~/.log/trim.log;
                read;'
        fi
else
        rm ~/.log/trim.log 2>1 /dev/null
fi
