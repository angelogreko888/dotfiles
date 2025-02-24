#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

case $1 in
        i) sudo  reflector --age 1 --sort rate --country Israel --protocol https --verbose --save /etc/pacman.d/mirrorlist ;
		sudo sed -rie '/mivzakim/d' /etc/pacman.d/mirrorlist  ;
		echo "
Server = https://mirror.isoc.org.il/pub/archlinux/$repo/os/$arch
		" | sudo tee -a /etc/pacman.d/mirrorlist ;;
        c) sudo  reflector --age 1 --sort rate -n 5 --country Germany,Greece,Turkey,Israel,United Kingdom --protocol https --verbose --save /etc/pacman.d/mirrorlist ;;
        *) echo "enter country" && exit 0 ;;
esac

sudo pacman -Syy


