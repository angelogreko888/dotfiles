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
applications
backgrounds
gnome-shell
bin
fastfetch
fish
foot
gtk-2.0
gtk-3.0
gtk-4.0
home
ranger
xsettingsd
)

for ST in "${stow[@]}"; do
	stow "$ST"
done

cd ~
