#!/usr/bin/env bash

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

sudo sed -i '92s/#//' $pacman_conf

sudo sed -i '93s/#//' $pacman_conf

printf "\e[1;32m.......Enter Country.......: \n\e[0m"

select  cn in Israel Cyprus;do

	case $cn in

        Israel) 
		sudo  reflector --age 1 --sort rate --country Israel --protocol https --verbose --save /etc/pacman.d/mirrorlist 
                sudo sed -rie '/mivzakim/d' /etc/pacman.d/mirrorlist  
		break ;;

        Cyprus) 
		sudo  reflector --age 1 --sort rate -n 7 --country Greece,Tr,Israel,Germany,UK --protocol https --verbose --save /etc/pacman.d/mirrorlist 
		break ;;

	*) 
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2

	esac

done

sudo pacman -Syy

