#!/usr/bin/env bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

cd ~

lst=($(cat ~/dotfiles/0inst/aur.lst))

for PKG in "${lst[@]}";do
        yay -Su --needed --noconfirm "$PKG"
done

 if ! pacman -Q "$PKG" &>/dev/null; then
        printf "\e[1;31mERROR...Sorry, could not install... $PKG\e[0m\n" >&2
 fi

plst=($(cat ~/dotfiles/0inst/aaur.lst))

for PLST in "${plst[@]}";do
        printf "\n\e[1;32m... Do You Want To Install "$PLST"  ?  ... : \n\e[0m"
        select  yn in yes no;do
                case $yn in
                yes)
                        yay -Su --needed --noconfirm "$PLST"
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
