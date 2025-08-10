#!/bin/bash

echo "Sync Started"

#data
#rsync -a --exclude 'vago' --exclude '.cache' --exclude 'dotfiles'  $HOME/ /mnt/data/vago/ --delete
#
#rsync -a $HOME/dotfiles/ /mnt/data/sync-vago/dotfiles/ --delete
#
#rsync -a $HOME/vago/ /mnt/data/sync-vago/vago/ --delete
#
#
##vt
#rsync -a $HOME/vago/ /mnt/vt/sync-vago/vago/ --delete

rsync -a $HOME/dotfiles/ /mnt/vt/sync-vago/dotfiles/ --delete

echo "Sync Finished"

