function lo --wraps='sudo updatedb; locate' --description 'alias lo=sudo updatedb; locate'
  sudo updatedb; locate $argv
        
end
