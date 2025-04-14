#!/usr/bin/env bash

cd ~

ctl=(
cups
fstrim.timer
ufw
apparmor.service
paccache.timer 

)

#icons & fonts
sudo cp -r  ~/dotfiles/nouse/icons/buuf-nestort  /usr/share/icons/
sudo cp -r  ~/dotfiles/nouse/icons/radioactive-yellow /usr/share/icons/ 


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

id  vago

echo "Done!!!"
