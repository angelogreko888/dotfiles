#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(sudo timeshift --list |awk 'NR==13{print $3}')

exec foot sh -c 'sudo timeshift --create;
sudo timeshift  --delete  --snapshot $a;
echo done!!!; read'
