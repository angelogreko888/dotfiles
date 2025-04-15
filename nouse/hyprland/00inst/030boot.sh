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

pacman -Sy --needed --noconfirm  git sudo nano linux-headers networkmanager wpa_supplicant

bootctl --path=/boot install

if ! [ -d  /boot/loader/ ];then
	printf "\n\e[1;31m..... ERROR.... loader does not exist: \e[0m"
	exit 1
fi

blkid

printf "\n\e[1;32m..... enter root : \e[0m"
read rd

echo "
default  arch.conf
timeout  0
console-mode keep
editor   0
" | tee  /boot/loader/loader.conf

echo "
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=UUID=  rw quiet splash nvidia-drm.modeset=1 nvidia_drm.fbdev=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau lsm=landlock,lockdown,yama,integrity,apparmor,bpf
" | tee /boot/loader/entries/arch.conf

echo $(blkid | grep $rd | awk '{print $2}' | cut -b 7-42) | tee -a /boot/loader/entries/arch.conf

useradd -m vago

printf "\n\e[1;32m.....Enter User password: \e[0m"
read up
echo vago:$up | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults  timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager
systemctl enable systemd-boot-update.service

cat /boot/loader/entries/arch.conf | grep options

echo "exit umount  reboot"
