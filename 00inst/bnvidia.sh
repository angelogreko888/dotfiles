#!/usr/bin/env bash

cd ~

nvidia=(
	nvidia-open-dkms
	nvidia-utils
	libva
	opencl-clover-mesa
	opencl-nvidia
	lib32-nvidia-utils
	lib32-opencl-nvidia
	libvdpau
	libxnvctrl
	lib32-mesa 
	libva-mesa-driver 
	mesa-vdpau 

)

for PKG in "${nvidia[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done

yay -S --noconfirm libva-nvidia-driver-git

if grep -qE '^MODULES=.*nvidia. *nvidia_modeset.*nvidia_uvm.*nvidia_drm' /etc/mkinitcpio.conf; then
  echo "Nvidia modules already included in /etc/mkinitcpio.conf"
else
  sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
  echo "Nvidia modules added in /etc/mkinitcpio.conf"
fi

sudo mkinitcpio -P


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


echo "Done!!!"
