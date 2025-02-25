#!/bin/bash

cd ~

sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub


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

     # Check if rd.driver.blacklist=nouvea is present
     if ! sudo grep -q "rd.driver.blacklist=nouvea" /etc/default/grub; then
     sudo sed -i -e 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 rd.driver.blacklist=nouvea modprob.blacklist=nouvea)/' /etc/default/grub

     # Check if apparmor is present
    if ! sudo grep -q "apparmor" /etc/default/grub; then
    sudo sed -Ei 's/^(GRUB_CMDLINE_LINUX_DEFAULT=\([^\)]*)\)/\1 lsm=landlock,lockdown,yama,integrity,apparmor,bpf)/' /etc/default/grub
    echo "apparmor  added to /etc/default/grub"  

    # Regenerate GRUB configuration 
    if sudo grep -q "apparmor" /etc/default/grub || sudo grep -q "nvidia_drm.fbdev=1" /etc/default/grub; then
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

else
    echo "/etc/default/grub does not exist"
fi

echo "Done!!!"
