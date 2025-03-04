#!/usr/bin/env bash

is="$HOME/dotfiles/00inst/"
cp="020confpac-usr.sh"
nv="090nvidia.sh"
yy="10yay.sh"
pc="20pac.sh"
ar="30aur.sh"
pp="40pipewire.sh"
st="60stow.sh"
at="99active.sh"

cd ~

mkdir ~/log
touch ~/log/paclog aurlog

git clone https://github.com/angelogreko888/dotfiles

if ! [ -d ~/dotfiles ];then
	printf "\n\e[1;31m... ERROR Folder Does Not Exist ... : \n\e[0m"
	exit 1
fi

bash $is$cp
bash $is$yy

printf "\n\e[1;32m... Do You Want To Install Nvidia?  ... : \e[0m"

select  yn in yes no;do
	case $yn in

		yes)
			bash $is$nv
			break ;;

		no)
			printf "\n\e[1;32m... OK ... : \n\e[0m"
			break ;;

		*)
			printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

bash $is$pc
bash $is$ar
bash $is$pp
printf "\n\e[1;32m... press enter to activate hyprland ... : \e[0m"
read
hyprland
sleep 15
bash $is$st
bash $is$at

printf "\n\e[1;32m... Done user setup - reboot ... : \e[0m"
