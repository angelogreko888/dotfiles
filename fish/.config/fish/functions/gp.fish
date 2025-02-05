function gp --wraps='cd ~/dotfiles && git pull && cd -' --description 'alias gp=cd ~/dotfiles && git pull && cd -'
  cd ~/dotfiles && git pull && cd - $argv
        
end
