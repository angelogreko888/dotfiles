#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


apps=" synaptic timeshift terminator gnome-disk-utility gnome-tweaks eog evince evince-common gnome-system-monitor gnome-text-editor gparted simple-scan btop ufw gufw gnome-software stacer pavucontrol libavcodec-extra wget ripgrep exa file-roller git gnome-shell-extension-manager dconf-editor yaru-theme-gtk ncdu locate default-jre default-jdk android-tools-adb android-tools-fastboot curl fonts-cantarell thunar gnome-terminal cups system-config-printer thunar-archive-plugin thunar-volman yaru-theme-gnome-shell"

sudo apt install gnome-shell -y

sudo apt install gnome-session -y

xdg-user-dirs-update

sudo apt install $apps -y

#sudo apt install hplip hplip-gui

sudo apt --fix-broken install -y

sudo apt purge yelp yelp-tools -y

sudo apt autoremove -y

