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
#gtk-2.0
gtk-3.0
#gtk-4.0
home
hypr
ranger
waybar
xsettingsd
#swaync
dunst
flameshot
icons

)

for ST in "${stow[@]}"; do
	stow "$ST"
done

plst=(
kanshi

)

for PLST in "${plst[@]}";do
	printf "\n\e[1;32m... Do You Want To stow "$PLST"  ?  ... : \n\e[0m"
	select  yn in yes no;do
		case $yn in
		yes)
			stow "$PLST"
			break ;;
		no)
			printf "\n\e[1;32m... OK ... : \n\e[0m"
			break ;;
		*)
			printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
		esac
	done
done

cd ~
