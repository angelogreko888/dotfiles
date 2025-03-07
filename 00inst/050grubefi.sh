#!/usr/bin/env bash

printf "\e[1;32m.......Enter Country.......: \n\n\e[0m"
select  cn in Israel Cyprus;do
	case $cn in
        Israel) 
		ln -sf /usr/share/zoneinfo/Israel /etc/localtime
		break ;;
        Cyprus) 
		ln -sf /usr/share/zoneinfo/Europe/Nicosia /etc/localtime
		break ;;
	*) 
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done

hwclock --systohc
sed -i '171s/#//' /etc/locale.gen
sed -i '172s/#//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "greco" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 greco.localdomain greco" >> /etc/hosts

printf "\n\e[1;32m.....Enter Root password :\e[0m"
read rp
echo root:$rp | chpasswd 

pacman -Sy --needed --noconfirm sudo nano git  efibootmgr grub linux-headers networkmanager wpa_supplicant

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m vago

printf "\n\e[1;32m.....Enter User password: \e[0m"
read up
echo root:$up | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults  timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager


