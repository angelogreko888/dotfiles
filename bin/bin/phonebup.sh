#!/usr/bin/env bash

echo "start sync"

cd /run/user/1000/gvfs/
cd mtp:host=Xiaomi_Redmi_Note_13_dc536453
cd 'Internal shared storage'

rsync -a Pictures/ ~/vago/phone/Pictures --delete

rsync -a DCIM/ ~/vago/phone/DCIM --delete

rsync -a Documents/ ~/vago/phone/Documents --delete

rsync -a Download/ ~/vago/phone/Download --delete

rsync -a Movies/ ~/vago/phone/Movies --delete

rsync -a Music/ ~/vago/phone/Music --delete

rsync -a Recordings/ ~/vago/phone/Recordings --delete

echo "finished sync"
