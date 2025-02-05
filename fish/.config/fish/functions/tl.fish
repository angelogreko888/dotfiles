function tl --wraps='sudo timeshift --list' --description 'alias tl=sudo timeshift --list'
  sudo timeshift --list $argv
        
end
