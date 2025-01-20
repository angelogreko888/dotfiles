#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

if ! [ -d git ]; then
        mkdir ~/git
fi

cd ~/git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~


aur=(
aic94xx-firmware
android-sdk-platform-tools
anydesk-bin
ast-firmware
aurutils
bezier
checkupdates-with-aur
ctl
freetube-bin
hyprevents-git
hyprprop-git
hyprshade
hyprshot
libglade
librewolf-bin
libva-nvidia-driver-git
pyprland
simple-mtpfs
timeshift-autosnap
upd72020x-fw
uwsm
wd719x-firmware
)

for PKG in "${aur[@]}";do
        yay -Su --needed --noconfirm "$PKG"
done
