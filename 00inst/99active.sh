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
paccache.timer 
seatd
systemd-homed.service
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

#browsers
cp -r ~/dotfiles/nouse/brows/.libreoffice ~/
cp -r ~/dotfiles/nouse/brows/.mullvad ~/

#input group
if grep -q '^input:' /etc/group; then
	echo "'input' group exists."
else
        echo "'input' group doesn't exist. Creating 'input' group..."
        sudo groupadd input
        echo "'input' group created" 
fi

sudo usermod -aG input "$(whoami)"

#wheel group
sudo usermod -aG wheel "$(whoami)"
sudo usermod -aG users "$(whoami)"

#enable services
for CTL in "${ctl[@]}";do
	sudo systemctl enable "$CTL"
	echo ""$CTL" activated"
done

#firejail
sudo firecfg

# Check if apparmor is present in grub
if ! sudo grep -q "apparmor" /etc/default/grub; then
	sudo sed -Ei 's/^(GRUB_CMDLINE_LINUX_DEFAULT=\([^\)]".*\)"/\1 lsm=landlock,lockdown,yama,integrity,apparmor,bpf"/' /etc/default/grub
	echo "apparmor  added to grub"  
fi

# Regenerate GRUB configuration 
if sudo grep -q "apparmor" /etc/default/grub; then
  	sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

#fish
cp ~/dotfiles/nouse/rootmisc/fish_history ~/.local/share/fish/
cp ~/dotfiles/nouse/rootmisc/.bash_history ~/
chsh -s /usr/bin/fish

id  $whoami

echo "Done!!!"
