#!/bin/bash

 handle_error() {
       echo "An error occurred on line $1"
       exit 1
   }
  
   trap 'handle_error $LINENO' ERR


 apps=" synaptic timeshift terminator gnome-disk-utility eog gnupg evince gnome-text-editor gparted simple-scan btop ufw gufw stacer-bin pavucontrol wget ripgrep exa file-roller git dconf-editor ncdu  default-jre default-jdk android-tools-adb android-tools-fastboot curl fonts-cantarell thunar cups kdeconnect redshift gmtp flameshot yad cat stow"

 xdg-user-dirs-update

 sudo apt install $apps -y

#sudo apt install hplip hplip-gui

sudo apt purge gnome-software yelp yelp-tools yelp-xsl -y

sudo apt --fix-broken install -y

sudo apt autoremove -y

