#!/usr/bin/env bash

a=$(lsblk | grep shared | awk '{print $7}')

if [ $a == /mnt/shared-data ] &> /dev/null;then
echo "shared-data mounted"
else 
echo "mounting shared-data......"
sudo mount /dev/disk/by-label/shared-data /mnt/shared-data/
fi

echo "start sync"
rsync -a /mnt/shared-data/vago/ ~/vago/ --delete
rsync -a /mnt/shared-data/vp/ /mnt/data/vp/
echo "sync finished"
echo "unmounting ............."
sudo umount /mnt/shared-data
