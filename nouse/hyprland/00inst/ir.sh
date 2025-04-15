#!/usr/bin/env bash

ld=(
boot
home
vt
)

gh="<(curl -s https://raw.githubusercontent.com/angelogreko888/dotfiles/main/00inst/"
cp=""$gh"010confpac.sh)"
bt=""$gh"0030boot.sh)"
ef=""$gh"0050grubefi.sh)"
mb=""$gh"0060grubmbr.sh)"

lsblk

printf "\n\e[1;32mEnter Root directory name: \e[0m"
read rt
mount /dev/$rt /mnt

for LD in "${ld[@]}";do
	printf "\e[1;32m.......mount "$LD" ?: \n\e[0m"
	select  yn in yes no;do
        	case $yn in
        	yes) 
			printf "\n\e[1;32mEnter"$LD" directory name: \e[0m"
			read bd
			mount /dev/$bd /mnt/$LD
                	break ;;
        	no) 
			printf "\n\e[1;32mNo "$LD" directory \n\e[0m"
        	        break ;;
       		 *) 
                	printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
        	esac
	done
done

pacstrap -K /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

nano /mnt/etc/fstab

arch-chroot /mnt

sleep 3

pacman -Sy --needed --noconfirm  reflector

bash $cp

printf "\n\e[1;32m... Enter your choice ... : \n\e[0m"

select  bm in boot efi mbr;do
	case $bm in
		boot)
			bash $bt 
			break ;;
		efi)
			bash $ef 
			break ;;
		mbr)
			bash $mb 
			break ;;
		*)
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

printf "\n\n\e[1;32m ... Done Root Setup! Type exit, umount -a and reboot ...\n\n\e[0m"
