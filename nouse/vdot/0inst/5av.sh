#!/bin/bash

xdg-user-dirs-update

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/seatd /var/service
sudo ln -s /etc/sv/power-profiles-daemon /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/avahi-daemon/ /var/service/
sudo ln -s /etc/sv/ufw/ /var/service/


sudo usermod -aG _seatd vago
sudo usermod -aG audio vago
sudo usermod -aG video vago


sudo cp -r $HOME/vdot/icons/.local/share/icons/adw-gtk3-dark/ /usr/share/themes/

md -p /mnt/vt/sync-vago/vdot
echo vago ALL = NOPASSWD: /sbin/halt, /sbin/reboot, /sbin/poweroff | sudo tee etc/sudoers.d/power

