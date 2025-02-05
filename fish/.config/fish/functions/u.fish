function u --wraps='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm' --description 'alias u=sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'
  sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm $argv
        
end
