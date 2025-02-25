#!/bin/bash

pacman_conf="/etc/pacman.conf"

# Remove comments '#' from specific lines
lines_to_edit=(
    "Color"
    "CheckSpace"
    "VerbosePkgLists"
    "ParallelDownloads"
)

for line in "${lines_to_edit[@]}"; do
    if grep -q "^#$line" "$pacman_conf"; then
        sudo sed -i "s/^#$line/$line/" "$pacman_conf"
        echo "Uncommented: $line" 
    else
        echo "$line is already uncommented."
    fi
done

printf "\e[1;31m.......Enter Counry.......: \e[0m"
read cn

case $cn in
        i) sudo  reflector --age 1 --sort rate --country Israel --protocol https --verbose --save /etc/pacman.d/mirrorlist ;
                sudo sed -rie '/mivzakim/d' /etc/pacman.d/mirrorlist  ;
                echo "
Server = https://mirror.isoc.org.il/pub/archlinux/$repo/os/$arch
                " | sudo tee -a /etc/pacman.d/mirrorlist ;;
        c) sudo  reflector --age 1 --sort rate -n 5 --country Germany,Greece,Turkey,Israel,United Kingdom --protocol https --verbose --save /etc/pacman.d/mirrorlist ;;
esac

sed -i '92s/.//' $pacman_conf
sed -i '93s/.//' $pacman_conf


sudo pacman -Syy

