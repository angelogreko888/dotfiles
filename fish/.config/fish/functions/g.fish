function g --wraps='cd ~/dotfiles && git status && cd -' --description 'alias g=cd ~/dotfiles && git status && cd -'
  cd ~/dotfiles && git status && cd - $argv
        
end
