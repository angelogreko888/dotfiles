function spo --wraps='sudo systemctl poweroff' --description 'alias spo=sudo systemctl poweroff'
  sudo systemctl poweroff $argv
        
end
