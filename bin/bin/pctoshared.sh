#!/usr/bin/env bash

a=$(lsblk | grep shared | awk '{print $7}')

if [ $a == /mnt/shared-data ] &> /dev/null;then
sudo mount /dev/sdb /mnt/shared-data/
echo "start sync"
rsync -a ~/vago/ /mnt/shared-data/vago/  --delete
echo "sync finished"
else 
        echo "shared-data not mounted... quiting..."
	exit 0
fi


