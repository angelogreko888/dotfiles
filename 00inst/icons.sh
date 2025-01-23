#!/usr/bin/env bash

if [ -d /usr/share/icons/buuf-nestort/ ];then
	echo "buuf exists"
else
	sudo cp -r  ~/dotfiles/nouse/icons/buuf-nestort  /usr/share/icons/
	echo "buuf copied!!!"
fi

if [ -d /usr/share/icons/radioactive-yellow/ ];then
	echo "yellow exists"
else
	sudo cp -r  ~/dotfiles/nouse/icons/radioactive-yellow /usr/share/icons/ 
	echo "yellow copied!!!"
fi

