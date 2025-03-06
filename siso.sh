#!/usr/bin/env bash

lsblk

printf "\n\e[1;32mEnter Root directory name: \e[0m"
read rt
mount /dev/$rt /mnt

printf "\e[1;32m.......boot?: \n\e[0m"
select  yn in yes no;do
        case $yn in
        yes) 
		printf "\n\e[1;32mEnter Boot directory name: \e[0m"
		read bd
		mount /dev/$bd /mnt/boot 
                break ;;
        no) 
		printf "\n\e[1;32mNo Boot directory \n\e[0m"
                break ;;
        *) 
                printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        esac
done

printf "\n\e[1;32mEnter Home directory name: \e[0m"
read hm
mount /dev/$hm /mnt/home

pacstrap -K /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

nano /mnt/etc/fstab

arch-chroot /mnt
