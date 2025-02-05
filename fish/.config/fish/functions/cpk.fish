function cpk --wraps='du -sh /var/cache/pacman/pkg/' --description 'alias cpk=du -sh /var/cache/pacman/pkg/'
  du -sh /var/cache/pacman/pkg/ $argv
        
end
