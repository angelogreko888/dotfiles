#!/usr/bin/env bash

printf "\n\e[1;32m... Checking pacman packages.... continue ?  ... : \n\e[0m"
read
lst=($(cat ~/dotfiles/0inst/pac.lst))
for PKG in "${lst[@]}";do
        if ! pacman -Q "$PKG" &>/dev/null; then
                printf "\e[1;31mERROR... NOT Installed  >>>  $PKG \e[0m\n" >&2
        fi
done

printf "\n\e[1;32m... Checking yay packages.... continue ?  ... : \n\e[0m"
read

lst=($(cat ~/dotfiles/0inst/aur.lst))
for PKG in "${lst[@]}";do
        if ! pacman -Q "$PKG" &>/dev/null; then
		 printf "\e[1;31mERROR... NOT Installed  >>>  $PKG \e[0m\n" >&2
        fi
done

printf "\n\e[1;32m... Checking zram .... continue ?  ... : \n\e[0m"
read
cat /etc/systemd/zram-generator.conf


printf "\n\e[1;32m... Checking virtualbox .... continue ?  ... : \n\e[0m"
read
if pacman -Q virtualbox &>/dev/null; then
	if grep -q '^vboxsf:' /etc/group; then
       	echo "'vboxsf' group exists."
	else
       	echo "'vboxsf' group doesn't exist. Creating 'input' group..."
       	sudo groupadd vboxsf
       	echo "'vboxsf' group created" 
	fi
		a=(grep vboxsf /etc/group | awk -F: '{print $3}')
		if [ $a == vago ]; then
			echo
		else
			sudo usermod -aG vboxsf "$(whoami)"
		fi
else 
	echo
fi

printf "\n\e[1;32m... Checking groups.... continue ?  ... : \n\e[0m"
read
id $whoami




