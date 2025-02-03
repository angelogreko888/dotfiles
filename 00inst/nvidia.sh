#!/bin/bash

cd ~

nvidia=(
  nvidia-dkms
  nvidia-utils
  libva
  libva-nvidia-driver
 # lib32-nvidia-utils
)

for PKG in "${nvidia[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done


if grep -qE '^MODULES=.*nvidia. *nvidia_modeset.*nvidia_uvm.*nvidia_drm' /etc/mkinitcpio.conf; then
  echo "Nvidia modules already included in /etc/mkinitcpio.conf"
else
  sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf 
  echo "Nvidia modules added in /etc/mkinitcpio.conf"
fi


#echo"
#options nvidia-drm modeset=1 fbdev=1
#options nvidia NVreg_PreserveVideoMemoryAllocations=1 
#" | sudo tee /etc/modprobe.d/nvidia.conf 


sudo mkinitcpio -P 


# GRUB
# Check if /etc/default/grub exists
if [ -f /etc/default/grub ]; then
    # Check if nvidia-drm.modeset=1 is present
    if ! sudo grep -q "nvidia-drm.modeset=1" /etc/default/grub; then
        sudo sed -i -e 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 nvidia-drm.modeset=1"/' /etc/default/grub
        echo "nvidia-drm.modeset=1 added to /etc/default/grub" 
    fi

    # Check if nvidia_drm.fbdev=1 is present
    if ! sudo grep -q "nvidia_drm.fbdev=1" /etc/default/grub; then
        sudo sed -i -e 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 nvidia_drm.fbdev=1"/' /etc/default/grub
        echo "nvidia_drm.fbdev=1 added to /etc/default/grub" 
    fi


    # Regenerate GRUB configuration 
    if sudo grep -q "nvidia-drm.modeset=1" /etc/default/grub || sudo grep -q "nvidia_drm.fbdev=1" /etc/default/grub; then
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

else
    echo "/etc/default/grub does not exist"
fi

# Blacklist nouveau
    if [[ -z $blacklist_nouveau ]]; then
      read -n1 -rep "$Would you like to blacklist nouveau? (y/n)" blacklist_nouveau
    fi
echo
if [[ $blacklist_nouveau =~ ^[Yy]$ ]]; then
  NOUVEAU="/etc/modprobe.d/nouveau.conf"
  if [ -f "$NOUVEAU" ]; then
    printf "Seems like nouveau is already blacklisted.\n"
  else
    echo "blacklist nouveau" | sudo tee -a "$NOUVEAU" 
    printf "has been added to $NOUVEAU.\n"
    printf "\n"

    # To completely blacklist nouveau (See wiki.archlinux.org/title/Kernel_module#Blacklisting 6.1)
    if [ -f "/etc/modprobe.d/blacklist.conf" ]; then
      echo "install nouveau /bin/true" | sudo tee -a "/etc/modprobe.d/blacklist.conf"
    else
      echo "install nouveau /bin/true" | sudo tee "/etc/modprobe.d/blacklist.conf" 
    fi
  fi
else
  printf "Skipping nouveau blacklisting..." 
fi


if ! [ -d /etc/pacman.d/hooks ]; then
	sudo mkdir /etc/pacman.d/hooks
fi

echo "
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-dkms
Target=linux

[Action]
Description=Updating NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
" | sudo tee /etc/pacman.d/hooks/nvidia.hook



echo "Done!!!"
