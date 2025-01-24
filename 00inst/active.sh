#!/usr/bin/env bash

cd ~

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

hyprshade install
echo "Done!!!"
