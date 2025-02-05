function pd --wraps='sudo pacman -Qdtq | sudo pacman -Rns ' --description 'alias pd=sudo pacman -Qdtq | sudo pacman -Rns '
  sudo pacman -Qdtq | sudo pacman -Rns  $argv
        
end
