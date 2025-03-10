#!/usr/bin/env bash

ld=(
boot
swap
home
vt
)

lsblk

printf "\n\e[1;32m.......hard disk type? : \n\e[0m"
select  ns in nvme sda;do
        case $ns in
        nvme)
        aa=nvme0n1p
        break ;;
        sda)
        aa=sda
        break ;;
        *)
         printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >>
        esac
done

printf "\n\e[1;32mEnter Root directory number : \e[0m"
read rt
mkfs.ext4 /dev/$aa$rt 
mount /dev/$aa$rt /mnt

for LD in "${ld[@]}";do
	printf "\n\e[1;32m.......mount "$LD" ?: \n\e[0m"
	select  yn in yes no;do
        	case $yn in
        	yes) 
			printf "\n\e[1;32mEnter"$LD" directory name: \e[0m"
			read bd
			case $LD in
				boot)
					mkfs.fat -F32 /dev/$aa$bd
					mount /dev/$aa$bd /mnt/$LD
					break ;;
				swap)
					mkswap /dev/$aa$bd
					swapon /dev/$aa$bd 
                			break ;;
				home)
					mkfs.ext4 /dev/$aa$bd
					mount --mkdir /dev/$aa$bd /mnt/$LD
					break ;;
				vt)
                                        mkfs.ext4 /dev/$aa$bd
                                        mount --mkdir /dev/$aa$bd /mnt/$LD
                                        break ;;
			esac
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
