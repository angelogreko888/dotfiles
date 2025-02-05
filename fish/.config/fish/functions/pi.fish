function pi --wraps='sudo pacman -Syu --needed ' --description 'alias pi=sudo pacman -Syu --needed '
  sudo pacman -Syu --needed  $argv
        
end
