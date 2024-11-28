#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR

sudo apt update

sudo apt dist-upgrade -y

sudo apt install linux-headers-amd64 -y

sudo apt --fix-broken install -y

sudo apt autoremove -y
