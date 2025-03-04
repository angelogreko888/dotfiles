#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR
  exec 2 >> ~/log/paclog

source ~/dotfiles/00inst/pac.lst

cd ~


for PKG in "${lst[@]}";do
        sudo pacman -Su --needed --noconfirm "$PKG"
done

for PKG in "${lst[@]}";do
        if ! sudo pacman -Q "$PKG" &>/dev/null; then
        printf "\e[1;31mERROR...Sorry, could not install... $PKG\e[0m\n" 2>&1 |tee -a ~/log/paclog &>/dev/null
   fi
done

printf "\n\e[1;32m... Do You Want To Install kanshi?  ... : \e[0m"

select  yn in yes no;do
	case $yn in
		yes)
			sudo pacman -Su --needed --noconfirm kanshi
			break ;;
		no)
			printf "\n\e[1;32m... OK ... : \n\e[0m"
			break ;;
		*)
			printf "\n\e[1;31m... !!! ERROR Enter Your Choice !!! ... \e[0m" >&2
	esac
done
