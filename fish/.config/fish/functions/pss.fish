function pss --wraps='sudo pacman -Ss' --description 'alias pss=sudo pacman -Ss'
  sudo pacman -Ss $argv
        
end
