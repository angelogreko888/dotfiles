#!/usr/bin/env bash

echo "Sync Started"

#data
rsync -a /home/vago/ /mnt/data/vago/ --delete

#rsync -a /home/vago/dotfiles/ /mnt/data/sync-vago/dotfiles/ --delete

rsync -a /home/vago/vago/ /mnt/data/sync-vago/vago/ --delete

rsync -a /home/vago/dotnix/ /mnt/data/sync-vago/dotnix/ --delete

#vt
rsync -a /home/vago/vago/ /mnt/vt/sync-vago/vago/ --delete

#rsync -a /home/vago/dotfiles/ /vt/sync-vago/dotfiles/ --delete

rsync -a /home/vago/dotnix/ /mnt/vt/sync-vago/dotnix/ --delete

echo "Sync Finished"


