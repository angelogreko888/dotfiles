#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

sudo timeshift --create
a=$(sudo timeshift --list |awk 'NR==13{print $3}')
sudo timeshift  --delete  --snapshot $a
