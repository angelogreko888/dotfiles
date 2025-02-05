function pl --wraps='sudo cat /var/log/pacman.log' --description 'alias pl=sudo cat /var/log/pacman.log'
  sudo cat /var/log/pacman.log $argv
        
end
