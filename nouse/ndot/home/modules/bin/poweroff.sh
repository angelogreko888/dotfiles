#!/usr/bin/env bash
rm -rf ~/.cache/* 
sleep 0.5
~/bin/fishh.sh
sleep 0.5
~/bin/bup.sh
sleep 0.5
~/bin/gpush.sh
sleep 0.5
pkill sleep
rm /var/tmp/sync.sh.flag
rm /var/tmp/gitpull.sh.flag

poweroff
