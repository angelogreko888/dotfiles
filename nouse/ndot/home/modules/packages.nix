{pkgs, ...}:{

  nixpkgs.config.allowUnfree = true;


  programs.imv = {
    enable = true;
    settings = {
      options.overlay = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme ="buuf-nestort";
    };
   };

  home.packages = with pkgs; [

vulkan-headers
vulkan-loader
gtk-layer-shell
xdg-dbus-proxy
xdg-desktop-portal
xdg-desktop-portal-gtk
xdg-utils
libdrm

nwg-look
font-awesome
nerd-fonts.jetbrains-mono
libadwaita
dpkg
file-roller
vaapi-intel-hybrid
libva1

hyprprop
yad
w3m
mullvad-browser
brlaser
xdg-user-dirs
cups-pdf-to-pdf
eog
evince
fwupd
gimp3-with-plugins
gnome-calculator
gnome-disk-utility
gnome-text-editor
gparted
less
libreoffice-fresh
ncdu
nanorc
power-profiles-daemon
ripgrep
rsync
simple-scan
timeshift
usb-modeswitch
usbutils
vim
yt-dlp
iw
iwd
dconf-editor
dmidecode
dosfstools
font-manager
inotify-tools
mtools
usbutils
udiskie
udisks
ntfs3g
freetube
tree
nix-tree
anydesk
flameshot
python3
dysk
hypridle

  
  htop
  btop
  librewolf
  git
  mesa
  pavucontrol
  pamixer
  fuzzel
  brightnessctl
  libnotify
  swaybg
  killall
  eza
  adwaita-qt  
  adwaita-qt6
  kanshi
  gtk3
  gtk4
  adw-gtk3

    gvfs
    glib
    gdb
    lsof
    pulseaudio 
    alsa-utils
    wget
    rar 
    zip 
    unzip 
    p7zip
    imagemagick

    networkmanager
    networkmanagerapplet    

    mpv
    nemo-with-extensions
    nemo-emblems
    nemo-fileroller

    gnome-font-viewer
    evince
    simple-scan
    gnome-text-editor

];
}


