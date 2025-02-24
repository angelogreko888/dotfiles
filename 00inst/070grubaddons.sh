#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub

sudo sed -Ei 's/^(GRUB_CMDLINE_LINUX_DEFAULT=\([^\)]*)\)/\1 nvidia_drm.modeset=1 nvidia_drm.fbdev=1 rd.driver.blacklist=nouvea modprob.blacklist=nouvea  lsm=landlock,lockdown,yama,integrity,apparmor,bpf)/' /etc/default/grub 


if sudo grep -q "apparmor" /etc/default/grub; then
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	echo "Done!!!!"
else 
	echo "something went wrong - grub"    
fi

