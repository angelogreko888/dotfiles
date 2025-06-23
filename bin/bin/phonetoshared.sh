#!/usr/bin/env bash

echo "start sync"

cd /run/user/1000/gvfs/
cd mtp:host=Xiaomi_Redmi_Note_13_dc536453
cd 'Internal shared storage'

rsync -a Pictures/ /mnt/shared-data/phone/Pictures

rsync -a DCIM/ /mnt/shared-data/phone/DCIM

rsync -a Documents/ /mnt/shared-data/phone/Documents

rsync -a Download/ /mnt/shared-data/phone/Download

rsync -a Movies/ /mnt/shared-data/phone/Movies

rsync -a Music/ /mnt/shared-data/phone/Music

rsync -a Recordings/ /mnt/shared-data/phone/Recordings

rsync -a /mnt/shared-data/phone/ /mnt/data/phone

echo "finished sync"
