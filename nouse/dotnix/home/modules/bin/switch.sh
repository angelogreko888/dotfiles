#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(hostnamectl | rg Model | awk '{print $3}')

if [ $a == LOQ ];then
cp=loq
elif [ $a == Lenovo ];then
cp=legion
fi

case $cp in
        loq)  ;;
        legion)  ;;
        d)  ;;
        *) echo "enter a laptop name" && exit 0 ;;
esac

sudo nixos-rebuild switch --flake ~/dotnix/nix/#$cp

home-manager switch --flake ~/dotnix/home/#vago
