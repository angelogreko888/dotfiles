#!/usr/bin/env bash 

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

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

     # Check if rd.driver.blacklist=nouveau is present
     if ! sudo grep -q "rd.driver.blacklist=nouveau" /etc/default/grub; then
     sudo sed -i -e 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"/' /etc/default/grub
      echo "rd.driver.blacklist=nouveau added to /etc/default/grub" 
     fi

    # Regenerate GRUB configuration 
    if sudo grep -q "rd.driver.blacklist=nouveau" /etc/default/grub || sudo grep -q "nvidia_drm.fbdev=1" /etc/default/grub; then
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

else
    echo "/etc/default/grub does not exist"
fi

echo "
options nvidia NVreg_UsePageAttributeTable=1 NVreg_RegistryDwords="OverrideMaxPerf=0x1"
" | sudo tee /etc/modprobe.d/nvidia.conf


sudo pacman -S --noconfirm --needed nvidia-dkms nvidia-utils lib32-nvidia-utils libva-nvidia-driver  lib32-opencl-nvidia opencl-nvidia

sudo mkinitcpio -P

ctl=(
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service

)

for CTL in "${ctl[@]}";do
        sudo systemctl enable "$CTL"
        echo ""$CTL" activated"
done
