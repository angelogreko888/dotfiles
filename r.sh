#!/usr/bin/env bash

gh="https://raw.githubusercontent.com/angelogreko888/dotfiles/main/00inst/"
cp="010confpac.sh"
bt="030boot.sh"
ef="050grubefi.sh"
gt="060grubgpt.sh"

pacman -Sy --needed --noconfirm  wget nano reflector

printf "\n\e[1;32m... Enter your choice ... : \n\e[0m"

select  bm in efi gpt;do
	case $bm in
		efi)
                        wget $gh$ef $gh$cp
                        bb=$ef
			break ;;
		gpt)
                        wget $gh$gt $gh$cp
                        bb=$gt
			break ;;
		*)
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

if  [ -f "$cp" ] && [ -f "$bb" ];then
        chmod +x 0*
        bash $cp
        bash $bb 
else
        printf "\n\e[1;31m!!! Something went wrong- missing file !!! \e[0m"
        exit 1 
fi

printf "\n\n\e[1;32m ... Done Root Setup! Type exit, umount -a and reboot ...\n\n\e[0m"
