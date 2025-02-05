function gg --wraps='cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd -' --description 'alias gg=cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd -'
  cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd - $argv
        
end
