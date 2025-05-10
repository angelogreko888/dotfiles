#!/usr/bin/env bash

cd ~

ctl=(
ly
cups
fstrim.timer
ufw
avahi-daemon
upower
adb
systemd-resolved.service
apparmor.service
systemd-homed.service
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service
acpid

)

#zram
if pacman -Q zram-generator ;then
echo "
[zram0]
zram-size = min(ram / 2)
compression-algorithm = zstd
" | sudo tee /etc/systemd/zram-generator.conf
fi

#icons & fonts
sudo cp -r  ~/dotfiles/nouse/icons/buuf-nestort  /usr/share/icons/
sudo cp -r  ~/dotfiles/nouse/icons/radioactive-yellow /usr/share/icons/ 
sudo cp ~/dotfiles/nouse/fonts/NotoColorEmoji-flagsonly.ttf /usr/share/fonts 

#input group
if grep -q '^input:' /etc/group; then
	echo "'input' group exists."
else
        echo "'input' group doesn't exist. Creating 'input' group..."
        sudo groupadd input
        echo "'input' group created" 
fi

sudo usermod -aG input "$(whoami)"

#groups
sudo usermod -aG wheel "$(whoami)"
sudo usermod -aG users "$(whoami)"

#enable services
for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done

printf "\n\e[1;32m......install br printer" ?: \n\e[0m"
        select  yn in yes no;do
                case $yn in
                yes)  
			~/dotfiles/0inst/900pbr.sh
			break ;;

		no) 
			echo
                        break ;;
                 *) 
                        printf "\n\e[1;31m... !!! ERROR Enter Your Choice !>
                esac

#fish
cp ~/dotfiles/nouse/rootmisc/fish_history ~/.local/share/fish/
cp ~/dotfiles/nouse/rootmisc/.bash_history ~/
chsh -s /usr/bin/fish

#firejail
sudo firecfg

id  $whoami

echo "Done!!!"
