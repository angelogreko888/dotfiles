function pud --wraps='sudo pacman -Syu' --description 'alias pud=sudo pacman -Syu'
  sudo pacman -Syu $argv
        
end
