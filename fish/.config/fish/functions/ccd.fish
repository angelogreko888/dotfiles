function ccd --wraps='rm -rf ~/.cache/*' --description 'alias ccd=rm -rf ~/.cache/*'
  rm -rf ~/.cache/* $argv
        
end
