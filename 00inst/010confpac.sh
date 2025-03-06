#!/usr/bin/env bash

pacma -Sy --needed --noconfirm reflector

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
        sed -i "s/^#$line/$line/" "$pacman_conf"
        echo "Uncommented: $line" 
    else
        echo "$line is already uncommented."
    fi
done

sed -i '92s/#//' $pacman_conf

sed -i '93s/#//' $pacman_conf

printf "\e[1;32m.......Enter Country.......: \n\e[0m"

select  cn in Israel Cyprus;do

	case $cn in

        Israel) 
		reflector --latest 5 --sort rate --country Israel --protocol https --verbose --save /etc/pacman.d/mirrorlist 
                sed -rie '/mivzakim/d' /etc/pacman.d/mirrorlist  
		break ;;

        Cyprus) 
		reflector --latest 5 --sort rate  --country Greece,Tr,Israel,Germany,'United Kingdom' --protocol https --verbose --save /etc/pacman.d/mirrorlist 
		break ;;

	*) 
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2

	esac

done

pacman -Syy

