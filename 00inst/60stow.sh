#!/usr/bin/env bash

if [ -d ~/.config/hypr ];then
	rm -rf ~/.config/hypr
else
	echo "hypr does not exist"
	exit 1
fi

rm ~/.bashrc

cd ~/dotfiles

stow=(
backgrounds
bin
fastfetch
fish
foot
fuzzel
gtk-2.0
gtk-3.0
gtk-4.0
home
hypr
kanshi
ranger
swaync
uwsm
waybar
xsettingsd
)


for ST in "${stow[@]}"; do
	stow "$ST"
done
