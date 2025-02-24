#!/bin/bash

cd ~

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

echo "Done!!!"
