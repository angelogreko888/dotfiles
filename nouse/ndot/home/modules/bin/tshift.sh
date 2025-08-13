#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(sudo timeshift --list | awk 'NR==12{print $3}')
sudo timeshift --delete --snapshot $a
sudo timeshift --create
