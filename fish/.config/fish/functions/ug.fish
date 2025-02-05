function ug --wraps='sudo grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias ug=sudo grub-mkconfig -o /boot/grub/grub.cfg'
  sudo grub-mkconfig -o /boot/grub/grub.cfg $argv
        
end
