function dkil --wraps='dpkg --get-selections | grep -v deinstall' --description 'alias dkil=dpkg --get-selections | grep -v deinstall'
  dpkg --get-selections | grep -v deinstall $argv
        
end
