#!/bin/bash

echo "Sync Started"

#data
#rsync -a --exclude 'vago' --exclude '.cache' --exclude 'dotfiles' --exclude 'data' /home/vago/ /mnt/data/vago/ --delete

rsync -a /home/vago/dotfiles/ /mnt/data/sync-vago/dotfiles/ --delete

rsync -a /home/vago/vago/ /mnt/data/sync-vago/vago/ --delete


#vt
rsync -a /home/vago/vago/ /mnt/vt/sync-vago/vago/ --delete

rsync -a /home/vago/dotfiles/ /mnt/vt/sync-vago/dotfiles/ --delete

echo "Sync Finished"

