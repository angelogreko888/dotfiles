#!/usr/bin/env bash

pac-conf="/etc/pacman.conf"

# Remove comments '#' from specific lines
lines_to_edit=(
    "Color"
    "CheckSpace"
    "VerbosePkgLists"
    )

for line in "${lines_to_edit[@]}"; do
    if grep -q "^#$line" "$pac-conf"; then
        sudo sed -i "s/^#$line/$line/" "$pac-conf"
        echo "Uncommented: $line" 
    else
        echo "$line is already uncommented."
    fi
done

sudo sed -i '92s/#//' $pac-conf

sudo sed -i '93s/#//' $pac-conf

printf "\e[1;32m.......Enter Country.......: \n\e[0m"

select  cn in Israel Cyprus;do

	case $cn in

        Israel) 
		sudo  reflector --latest 5 --sort rate --country Israel --protocol https --verbose --save /etc/pacman.d/mirrorlist 
                sudo sed -rie '/mivzakim/d' /etc/pacman.d/mirrorlist  
		break ;;

        Cyprus) 
#		sudo  reflector --latest 5 --sort rate  --country Greece,Tr,Israel,Germany,'United Kingdom'  --protocol https --verbose --save /etc/pacman.d/mirrorlist 
		echo
		break ;;

	*) 
		printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2

	esac

done

sudo pacman -Syy

