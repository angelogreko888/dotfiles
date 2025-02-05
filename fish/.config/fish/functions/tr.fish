function tr --wraps='sudo timeshift --restore' --description 'alias tr=sudo timeshift --restore'
  sudo timeshift --restore $argv
        
end
