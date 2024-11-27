#!/bin/bash

handle_error() {
         echo "An error occurred on line $1"
         exit 1
     }
    
     trap 'handle_error $LINENO' ERR

#mkdir /home/vago/.config/gxkb/
mkdir /home/vago/.config/i3/
mkdir -p /home/vago/.config/i3blocks/modules/
#sudo cp /usr/share/i3blocks/* /home/vago/.config/i3blocks/modules/
#cp /home/vago/git/gnome/configi3blocks /home/vago/.config/i3blocks/config
#cp /home/vago/git/gnome/configi3 /home/vago/.config/i3/config
#cp /home/vago/git/gnome/.gtkrc-2.0.mine /home/vago/
#cp /home/vago/git/gnome/.nanorc /home/vago/
#cp /home/vago/git/gnome/gxkb.cfg /home/vago/.config/gxkb/
sudo cp /home/vago/git/gnome/fonts/*  /usr/share/fonts/
#sudo cp /home/vago/git/gnome/pic/il.png /usr/share/gxkb/flags/
sudo cp -r /home/vago/git/gnome/buuf-nestort /usr/share/icons/
sudo cp -r /home/vago/git/gnome/radioactive-yellow /usr/share/icons/



sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub
sudo update-grub

#echo "
#PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h: \[\033[1;36m\]\w\[\033[1;33m\] $\[\033[0m\] '
# " | tee -a /home/vago/.bashrc

#sed -i 's/HISTSIZE=1000/HISTSIZE=10000/' /home/vago/.bashrc

mkdir /home/vago/bin
#mkdir /home/vago/.icons

#cp /home/vago/git/gnome/.bash_aliases /home/vago/
#cp /home/vago/git/gnome/.gitconfig /home/vago/


#sudo mv /etc/xdg/autostart/org.kde.kdeconnect.daemon.desktop org.kde.kdeconnect.daemon.desktop.nonactive
#sudo mv /etc/xdg/autostart/xdg-user-dirs-kde.desktop xdg-user-dirs-kde.desktop.nonactive
sudo mv /etc/xdg/autostart/geoclue-demo-agent.desktop geoclue-demo-agent.desktop.nonactive

