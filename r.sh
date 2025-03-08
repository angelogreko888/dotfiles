#!/usr/bin/env bash

gh="https://raw.githubusercontent.com/angelogreko888/dotfiles/main/00inst/"

cp="010confpac.sh"
bt="030boot.sh"
ef="050grubefi.sh"
mb="060grubmbr.sh"

lst=(
$cp
$bt
$ef
$mb
)

pacman -Sy --needed --noconfirm  wget nano reflector

for SU in "${lst[@]}";do
	wget $gh$SU
done

if ! [ -f "$cp" ] && [ -f "$bt" ]  && [ -f "$ef" ] && [ -f "$mb" ];then
	printf "\n\e[1;31m!!! Something went wrong- missing file !!! \e[0m"
        exit 1 
fi

chmod +x 0*

bash $cp

printf "\n\e[1;32m... Enter your choice ... : \n\e[0m"

select  bm in boot efi gpt;do
	case $bm in
		boot)
			bash $bt 
			break ;;
		efi)
			bash $ef 
			break ;;
		gpt)
			bash $mb 
			break ;;
		*)
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

printf "\n\n\e[1;32m ... Done Root Setup! Type exit, umount -a and reboot ...\n\n\e[0m"
