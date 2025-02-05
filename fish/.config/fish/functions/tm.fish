function tm --wraps='sudo fstrim -av' --description 'alias tm=sudo fstrim -av'
  sudo fstrim -av $argv
        
end
