#!/usr/bin/env bash

echo "Sync Started"

#data
rsync -a /home/vago/ /mnt/data/vago/ --delete

#rsync -a /home/vago/dotfiles/ /mnt/data/sync-vago/dotfiles/ --delete

rsync -a /home/vago/vago/ /mnt/data/sync-vago/vago/ --delete

rsync -a /home/vago/ndot/ /mnt/data/sync-vago/ndot/ --delete

#vt
rsync -a /home/vago/vago/ /mnt/vt/sync-vago/vago/ --delete

#rsync -a /home/vago/dotfiles/ /vt/sync-vago/dotfiles/ --delete

rsync -a /home/vago/ndot/ /mnt/vt/sync-vago/ndot/ --delete

echo "Sync Finished"


