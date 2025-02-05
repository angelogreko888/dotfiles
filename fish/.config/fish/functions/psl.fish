function psl --wraps='sudo nano /etc/pacman.conf' --description 'alias psl=sudo nano /etc/pacman.conf'
  sudo nano /etc/pacman.conf $argv
        
end
