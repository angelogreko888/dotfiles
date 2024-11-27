#!/bin/bash
 
  handle_error() {
        echo "An error occurred on line $1"
        exit 1
    }
   
    trap 'handle_error $LINENO' ERR

cd /home/vago/Downloads

wget https://www.virtualbox.org/download/oracle_vbox_2016.asc

echo "
deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib
" | tee -a /etc/apt/sources.list

sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor oracle_vbox_2016.asc

sudo apt update

sudo apt install virtualbox-7.0 -y

sudo usermod -aG vboxusers vago
