#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


cd ~

pac=(
aquamarine
arc-gtk-theme
arch-install-scripts
base
base-devel
btop
btrfs-progs
cups-pdf
dconf-editor
dosfstools
efibootmgr
eog
evince
eza
fastfetch
file-roller
firefox
font-manager
foot
fuzzel
fwupd
gimp
git
gmtp
gnome-calculator
gnome-disk-utility
gnome-text-editor
gparted
grim
grub
grub-btrfs
gst-plugin-pipewire
gufw
hdparm
htop
hyprgraphics
hypridle
hyprland
hyprland-qtutils
hyprlang
hyprlock
hyprutils
imagemagick
inotify-tools
intel-ucode
inxi
iw
iwd
jdk-openjdk
kanshi
less
lib32-nvidia-utils
libpulse
libreoffice-fresh
linux
linux-firmware
linux-firmware-qlogic
linux-headers
ly
mtools
nano
ncdu
nemo
network-manager-applet
networkmanager
nmap
nvidia-dkms
nvidia-utils
nwg-look
pacman-contrib
pamixer
pavucontrol
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
plocate
power-profiles-daemon
python-pip
qt5-wayland
qt6-wayland
ranger
reflector
ripgrep
rsync
simple-scan
slurp
smartmontools
sof-firmware
stow
swaybg
swaync
timeshift
ttf-font-awesome
ttf-jetbrains-mono-nerd
ufw
usbutils
vim
vlc
waybar
wget
wireless_tools
wireplumber
xdg-desktop-portal-gtk
xdg-desktop-portal-hyprland
xdg-user-dirs
yt-dlp
zram-generator
)


for PKG in "${pac[@]}";do
	sudo pacman -Su --needed --noconfirm "$PKG"
done 
