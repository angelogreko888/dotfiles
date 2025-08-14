#!/usr/bin/env bash

a=$(lsblk | grep shared | awk '{print $7}')

if [ $a == /mnt/shared-data ] &> /dev/null;then
echo "shared-data mounted"
else 
echo "mounting shared-data......"
sudo mount /dev/disk/by-label/shared-data /mnt/shared-data/
fi

echo "start sync"
rsync -a ~/vago/ /mnt/shared-data/vago/ --delete
rsync -a /mnt/data/vp/ /mnt/shared-data/vp/ 
echo "sync finished"
echo "unmounting .........."
sudo umount /mnt/shared-data
