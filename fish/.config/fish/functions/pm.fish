function pm --wraps='sudo nano /etc/pacman.d/mirrorlist' --description 'alias pm=sudo nano /etc/pacman.d/mirrorlist'
  sudo nano /etc/pacman.d/mirrorlist $argv
        
end
