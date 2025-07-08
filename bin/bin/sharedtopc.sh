#!/usr/bin/env bash

a=$(lsblk | grep shared | awk '{print $7}')
if [ $a == /mnt/shared-data ] &> /dev/null;then
echo "start sync"
rsync -a /mnt/shared-data/vago/ ~/vago/ --delete
echo "sync finished"
else 
        echo "shared-data not mounted... quiting..."
        exit 0
fi

