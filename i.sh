#!/usr/bin/env bash

lsblk


printf "\n\e[1;32mEnter Root directory name: \e[0m"
read rt
mkfs.ext4 /dev/nvme0n1p$rt 
mount /dev/nvme0n1p$rt /mnt

printf "\e[1;32m.......boot?: \n\e[0m"
select  yn in yes no;do
        case $yn in
        yes) 
		printf "\n\e[1;32mEnter Boot directory name: \e[0m"
		read bd
                printf "\n\e[1;32m... confirm boot : $bd" \e[0m"
                read
		mkfs.fat -F32 /dev/nvme0n1p$bd
		mount --mkdir /dev/nvme0n1p$bd /mnt/boot 
                break ;;
        no) 
		printf "\n\e[1;32mNo Boot directory \n\e[0m"
                break ;;
        *) 
                printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        esac
done


printf "\e[1;32m.......swap?: \n\e[0m"
select  yn in yes no;do
        case $yn in
        yes) 
                printf "\n\e[1;32mEnter swap directory name: \e[0m"
                read sw
		printf "\n\e[1;32m... confirm swap : "$sw" \e[0m"
		read
		mkswap /dev/nvme0n1p$sw 
		swapon /dev/nvme0n1p$sw 
                break ;;
        no) 
                printf "\n\e[1;32mNo swap directory \n\e[0m"
                break ;;
        *) 
                printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        esac
done


printf "\e[1;32m.......home?: \n\e[0m"
select  yn in yes no;do
        case $yn in
        yes) 
		printf "\n\e[1;32mEnter Home directory name: \e[0m"
		read hm
                printf "\n\e[1;32m... confirm home : "$hm" \e[0m"
                read
		mkfs.ext4 /dev/nvme0n1p$hm
		mount --mkdir /dev/nvme0n1p$hm /mnt/home
                break ;;
        no) 
                printf "\n\e[1;32mNo Home directory \n\e[0m"
                break ;;
        *) 
                printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        esac
done

printf "\e[1;32m.......vt?: \n\e[0m"
select  yn in yes no;do
        case $yn in
        yes) 
                printf "\n\e[1;32mEnter vt directory name: \e[0m"
                read vt
                printf "\n\e[1;32m... confirm vt : "$vt" \e[0m"
                read
		mkfs.ext4 /dev/nvme0n1p$vt
                mount --mkdir /dev/nvme0n1p$vt /mnt/vt
                break ;;
        no) 
                printf "\n\e[1;32mNo vt directory \n\e[0m"
                break ;;
        *) 
                printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        esac
done

lsblk

printf "\e[1;32m.......enter to continue?: \n\e[0m"
read 

pacstrap -K /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

nano /mnt/etc/fstab

arch-chroot /mnt

