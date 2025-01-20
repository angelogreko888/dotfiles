#!/usr/bin/env bash

ctl=(
ly 
cups
fstrim.timer
NetworkManager
ufw
avahi-daemon
upower

)

for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done
