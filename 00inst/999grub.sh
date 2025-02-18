#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub


if sudo grep -q "GRUB_TIMEOUT=1" /etc/default/grub; then
	sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

sudo pacman -Su btrfs-progs grub-btrfs

yay -Su grub-btrfs
