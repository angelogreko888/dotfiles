#!/usr/bin/env bash

cd ~

ctl=(
ly 
cups
fstrim.timer
ufw
avahi-daemon
upower
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service 

)

for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done

hyprshade install
echo "Done!!!"
