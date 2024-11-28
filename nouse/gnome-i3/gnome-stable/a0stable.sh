#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


sudo bash ./a1zram.sh

#sudo bash ./a2firmware.sh

sudo bash ./a3up.sh

sudo bash ./a4gnome.sh

sudo bash ./a5flatpak.sh

sudo bash ./a6firefox.sh

sudo bash ./a7privacy.sh

sudo bash ./a8fastfetch.sh

sudo bash ./a9freetube.sh

sudo bash ./aa1libreoffice.sh

sudo bash ./aa2anydesk.sh

sudo bash ./aa3virtualbox.sh 

sudo bash ./aaa1laststuff.sh
