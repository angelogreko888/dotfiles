#!/bin/bash

echo "Sync Started"

#data
rsync -a --exclude 'nvidia' --exclude 'gufw.py' --exclude 'mesa_shader_cache_db' /home/vago/ /mnt/data/vago/ --delete

rsync -a /home/vago/dotfiles/ /mnt/data/sync-vago/dotfiles/ --delete

rsync -a /home/vago/vago/ /mnt/data/sync-vago/vago/ --delete

rsync -a /home/vago/.librewolf/ /mnt/data/sync-vago/.librewolf/ --delete

#vt
rsync -a /home/vago/vago/ /vt/sync-vago/vago/ --delete

rsync -a /home/vago/.librewolf/ /vt/sync-vago/.librewolf/ --delete

rsync -a /home/vago/.mullvad/ /vt/sync-vago/.mullvad/ --delete

rsync -a /home/vago/dotfiles/ /vt/sync-vago/dotfiles/ --delete

echo "Sync Finished"

