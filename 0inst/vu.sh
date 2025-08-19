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


printf "\n\e[1;32m... Checking groups.... continue ?  ... : \n\e[0m"
read
id $whoami




