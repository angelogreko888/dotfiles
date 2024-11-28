#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub

sudo update-grub

####

echo "
   set linenumbers
  
   set titlecolor brightwhite,yellow
   set keycolor white,blue
   set functioncolor normal,normal
   set numbercolor white,magenta
   set errorcolor brightwhite,red
   set selectedcolor black,white
   set stripecolor black,white
   set statuscolor black,white
" | tee /home/vago/.nanorc

####

echo "
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h: \[\033[1;36m\]\w\[\033[1;33m\] $\[\033[0m\] '
" | tee -a /home/vago/.bashrc

sed -i 's/HISTSIZE=1000/HISTSIZE=10000/' /home/vago/.bashrc

####

mkdir /home/vago/bin
mkdir /home/vago/.icons

####

cp /home/vago/git/gnome/.bash_aliases /home/vago/
cp /home/vago/git/gnome/.gitconfig /home/vago/

####

sudo cp -r /home/vago/git/gnome/buuf-nestort /usr/share/icons/
sudo cp -r /home/vago/git/gnome/radioactive-yellow /usr/share/icons/
cp -r /home/vago/git/gnome/background /home/vago/.config/
cp -r /home/vago/git/gnome/.fonts /home/vago/

sudo updatedb
