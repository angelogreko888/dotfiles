sleep 1

rm -rf ~/.cache/* 

sleep 1

pacman -Qqe | grep -v "$(pacman -Qqm)" > $HOME/vago/pc/inst/pacman.lst

sleep 1

pacman -Qqm > $HOME/vago/pc/inst/aur.lst

sleep 1

~/bin/bup &

sleep 1

exit
