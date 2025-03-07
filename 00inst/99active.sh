#!/usr/bin/env bash

cd ~

ctl=(
ly
cups
fstrim.timer
ufw
avahi-daemon
upower
systemd-resolved.service
apparmor.service

)

nv=(
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service

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
        echo "User added to the 'input' group. Changes will take effect after you log out and log back in."


#enable services
for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done

if pacman -Q nvidia;then 
	for NV in "${nv[@]}";do
	        sudo systemctl enable "$NV"
        	echo ""$NV" activated"
	done
fi

#firejail
sudo firecfg

#fish
chsh -s /usr/bin/fish

id  $whoami

echo "Done!!!"
