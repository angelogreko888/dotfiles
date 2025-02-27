#!/usr/bin/env bash

ln -sf /usr/share/zoneinfo/Europe/Nicosia /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "greco" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 greco.localdomain greco" >> /etc/hosts

printf "\n\e[1;31mEnter root password: \e[0m"
read rp
echo root:$rp | chpasswd

pacman -S --needed --noconfirm sudo git nano base-devel grub linux-headers networkmanager wpa_supplicant

lsblk

printf "\n\e[1;31mEnter hdd name: \e[0m"
read hd

grub-install --target=i386-pc /dev/$hd
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m vago

printf "\n\e[1;31mEnter user password: \e[0m"
read up
echo vago:$up | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults	timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"


