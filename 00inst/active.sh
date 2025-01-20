#!/usr/bin/env bash

ctl=(
ly 
cups
fstrim.timer
NetworkManager
ufw

)

for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done
