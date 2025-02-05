function pu --wraps='sudo pacman -Syyu' --description 'alias pu=sudo pacman -Syyu'
  sudo pacman -Syyu $argv
        
end
