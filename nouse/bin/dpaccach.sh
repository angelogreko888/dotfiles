#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

sudo paccache -ruk0;
sudo paccache -rk1;
sudo pacman -Scc --noconfirm
yay -Scc --noconfirm
yay -Yc
a="$((pacman -Qdtq) | wc -l >/dev/null)"
if [ $a > 0 ];then
        sudo pacman -Rnsc $(pacman -Qdtq)
else 
        exit 0
fi
