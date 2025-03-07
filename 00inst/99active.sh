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

# Check if /etc/default/grub exists
if [ -f /etc/default/grub ]; then
     # Check if apparmor is present
    if ! sudo grep -q "apparmor" /etc/default/grub; then
    sudo sed -Ei 's/^(GRUB_CMDLINE_LINUX_DEFAULT=\([^\)]*)\)/\1 lsm=landlock,lockdown,yama,integrity,apparmor,bpf"/' /etc/default/grub
    echo "apparmor  added to grub"  
    fi

    # Regenerate GRUB configuration 
    if sudo grep -q "apparmor" /etc/default/grub; then
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

else
    echo "grub does not exist"
fi

# Check if arch.comf exists
if [ -f /boot/loader/entries/arch.conf ]; then
     # Check if apparmor is present
    if ! sudo grep -q "apparmor"  /boot/loader/entries/arch.conf; then
    sudo sed -Ei 's/^(options\([^\)]*)\)/\1 lsm=landlock,lockdown,yama,integrity,apparmor,bpf"/'  /boot/loader/entries/arch.conf
    echo "apparmor  added to arch.conf"  
    fi

    # Regenerate GRUB configuration 
    if sudo grep -q "apparmor"  /boot/loader/entries/arch.conf; then
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi

else
    echo "arch.conf does not exist"
fi


#fish
chsh -s /usr/bin/fish

id  $whoami

echo "Done!!!"
