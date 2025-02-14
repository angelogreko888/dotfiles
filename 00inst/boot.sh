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

pacman -S --needed --noconfirm nano base-devel linux-headers networkmanager pipewire pipewire-alsa pipewire-jack pipewire-pulse wpa_supplicant



useradd -m vago
echo vago:password | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults  timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager
