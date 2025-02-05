function tc --wraps='sudo timeshift --create' --description 'alias tc=sudo timeshift --create'
  sudo timeshift --create $argv
        
end
