function cpd --wraps='sudo pacman -Scc && yay -Scc' --description 'alias cpd=sudo pacman -Scc && yay -Scc'
  sudo pacman -Scc && yay -Scc $argv
        
end
