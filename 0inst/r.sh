#!/usr/bin/env bash

gh="https://raw.githubusercontent.com/angelogreko888/dotfiles/main/0inst/"
ef="050grubefi.sh"
gt="060grubgpt.sh"
bt="030boot.sh"

pacman -Sy --needed --noconfirm  wget nano 

printf "\n\e[1;32m... Enter your choice ... : \n\e[0m"

select  bm in efi boot gpt;do
	case $bm in
		efi)
                        wget $gh$ef 
                        bb=$ef
			break ;;
		gpt)
                        wget $gh$gt 
                        bb=$gt
			break ;;
		boot)
			wget $gh$bt
			bb=$bt
			break ;;
		*)
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

if [ -f "$bb" ];then
        chmod +x $bb
        bash $bb 
else
        printf "\n\e[1;31m!!! Something went wrong- missing file !!! \e[0m"
        exit 1 
fi

rm 0*

printf "\n\n\e[1;32m ... Done Root Setup! Type exit, umount -R /mnt and reboot ...\n\n\e[0m"
