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
#echo "127.0.0.1 localhost" >> /etc/hosts
#echo "::1       localhost" >> /etc/hosts
#echo "127.0.1.1 greco.localdomain greco" >> /etc/hosts

printf "\n\e[1;32mEnter Root password \n\e[0m"
while true; do
  read -s -p "Password: " rp
  echo
  read -s -p "Password (again): " rpr
  echo
  [ "$rp" = "$rpr" ] &&  echo root:$rp | chpasswd && break
  echo "Please try again"
done

pacman -S --needed --noconfirm sudo wget git nano base-devel grub linux-headers networkmanager 

lsblk

printf "\n\e[1;32mEnter hdd name: \e[0m"
read hd

grub-install --target=i386-pc /dev/$hd
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m vago

printf "\n\e[1;32mEnter User password \n\e[0m"
while true; do
  read -s -p "Password: " up
  echo
  read -s -p "Password (again): " upr
  echo
  [ "$up" = "$upr" ] &&  echo root:$up | chpasswd && break
  echo "Please try again"
done

echo "vago ALL=(ALL) ALL" >> /etc/sudoers.d/vago
echo "Defaults	timestamp_timeout=999" >> /etc/sudoers.d/vago

systemctl enable NetworkManager



