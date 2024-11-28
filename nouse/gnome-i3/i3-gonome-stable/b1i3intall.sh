#!/bin/bash

handle_error() {
         echo "An error occurred on line $1"
         exit 1
     }
    
     trap 'handle_error $LINENO' ERR


sudo apt install i3 i3blocks lightdm x11-xserver-utils nm-tray pulseaudio gnupg feh rofi lightdm-gtk-greeter lxappearance arandr arc-theme redshift xautolock numlockx xinput
