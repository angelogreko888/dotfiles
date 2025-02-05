function pui --wraps='sudo pacman -Rns' --description 'alias pui=sudo pacman -Rns'
  sudo pacman -Rns $argv
        
end
