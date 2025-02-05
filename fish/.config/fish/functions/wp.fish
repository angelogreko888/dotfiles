function wp --wraps='curl wttr.in/paphos' --description 'alias wp=curl wttr.in/paphos'
  curl wttr.in/paphos $argv
        
end
