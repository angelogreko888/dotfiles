#!/usr/bin/env bash

cd ~

ctl=(
ly
cups
fstrim.timer
ufw
avahi-daemon
upower
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service
systemd-resolved.service
apparmor.service

)

#zram
echo "
[zram0]
zram-size = min(ram / 2)
compression-algorithm = zstd
" | sudo tee /etc/systemd/zram-generator.conf

echo "Done zram!"

#icons & fonts
if [ -d /usr/share/icons/buuf-nestort/ ];then
	echo "buuf exists"
else
	sudo cp -r  ~/dotfiles/nouse/icons/buuf-nestort  /usr/share/icons/
	echo "buuf copied!!!"
fi

if [ -d /usr/share/icons/radioactive-yellow/ ];then
	echo "yellow exists"
else
	sudo cp -r  ~/dotfiles/nouse/icons/radioactive-yellow /usr/share/icons/ 
	echo "yellow copied!!!"
fi

sudo cp ~/dotfiles/nouse/fonts/NotoColorEmoji-flagsonly.ttf /usr/share/fonts 
echo "flags copied!!!"

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

#firejail
sudo firecfg

#fish
chsh -s /usr/bin/fish

id  $whoami

echo "Done!!!"
