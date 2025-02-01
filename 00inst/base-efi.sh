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

cat ~/dotfiles/00int/befi | xargs pacman -S --needed --noconfirm

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m vago
echo vago:password | chpasswd

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

