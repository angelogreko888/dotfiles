#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

source ~/dotfiles/00inst/gpac.lst

cd ~


for PKG in "${lst[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done

for PLST in "${plst[@]}";do
	printf "\n\e[1;32m... Do You Want To Install "$PLST"  ?  ... : \n\e[0m"
	select  yn in yes no;do
		case $yn in
		yes)
			sudo pacman -Su --needed --noconfirm "$PLST"
			if ! pacman -Q "$PLST" &>/dev/null; then
                  	      printf "\e[1;31mERROR...Sorry, could not install... "$PLST" \e[0m\n" >&2
        		fi
			break ;;
		no)
			printf "\n\e[1;32m... OK ... : \n\e[0m"
			break ;;
		*)
			printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
		esac
	done
done


