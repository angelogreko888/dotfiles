#!/usr/bin/env bash

echo "start sync"

cd /run/user/1000/gvfs/
cd mtp:host=Xiaomi_Redmi_Note_13_dc536453
cd 'Internal shared storage'

rsync -a Pictures/ ~/vago/phone/Pictures

rsync -a DCIM/ ~/vago/phone/DCIM

rsync -a Documents/ ~/vago/phone/Documents

rsync -a Download/ ~/vago/phone/Download

rsync -a Movies/ ~/vago/phone/Movies

rsync -a Music/ ~/vago/phone/Music

rsync -a Recordings/ ~/vago/phone/Recordings

echo "finished sync"
