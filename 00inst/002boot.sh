#!/usr/bin/env bash

ln -sf /usr/share/zoneinfo/Israel /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "greco" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 greco.localdomain greco" >> /etc/hosts
echo root:password | chpasswd

pacman -S --needed --noconfirm git sudo nano base-devel linux-headers networkmanager wpa_supplicant

bootctl --path=/boot install

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
options root=UUID=  rw quite splash nvidia-drm.modeset=1 nvidia_drm.fbdev=1 rd.driver.blacklist=nouvea modprob.blacklist=nouvea lsm=landlock,lockdown,yama,integrity,apparmor,bpf
" | tee /boot/loader/entries/arch.conf

useradd -m vago
echo vago:password | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults  timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager
systemctl enable systemd-boot-update.service

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
