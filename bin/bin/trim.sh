#!/usr/bin/env bash


a=$(date | awk '{print $1}')

if [ $a == Fri ];then
        if ! [ -f ~/.log/trim.log ]; then
                exec foot sh -c '
		 printf "\n\e[1;32m....... trim....... \n\e[0m"  
                sudo fstrim -av;
                echo $(date) > ~/.log/trim.log;
                '
        fi
else
	if [ -f ~/.log/trim.log ]; then
		rm ~/.log/trim.log 
	fi
fi
