#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


sudo apt install zram-tools -y

sed -i -e 's/#ALGO=lz4/ALGO=lz4/' -e 's/#PERCENT=50/PERCENT=50/' /etc/default/zramswap  

sudo systemctl restart zramswap.service

