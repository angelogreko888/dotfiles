#!/usr/bin/env bash 

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

if ! [ -d git ]; then
        mkdir ~/git
fi

if [ -f /etc/modprobe.d/nouveau.conf ]; then
  printf "Seems like nouveau is already blacklisted."
else
  echo "blacklist nouveau" | sudo tee -a "/etc/modprobe.d/nouveau.conf" 

  if [ -f "/etc/modprobe.d/blacklist.conf" ]; then
    echo "install nouveau /bin/true" | sudo tee -a "/etc/modprobe.d/blacklist.conf"
  else
    echo "install nouveau /bin/true" | sudo tee "/etc/modprobe.d/blacklist.conf"
  fi
fi

if grep -qE '^MODULES=.*nvidia. *nvidia_modeset.*nvidia_uvm.*nvidia_drm' /etc/mkinitcpio.conf; then
  echo "Nvidia modules already included in /etc/mkinitcpio.conf"
else
  sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
  echo "Nvidia modules added in /etc/mkinitcpio.conf"
fi

sudo sed -rie 's/kms//'  /etc/mkinitcpio.conf


cd ~/git

git clone  https://github.com/Frogging-Family/nvidia-all.git
cd  nvidia-all/
makepkg -si 

sudo mkinitcpio -P

