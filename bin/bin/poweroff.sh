#!/usr/bin/env bash

rm -rf ~/.cache/* 
sleep 0.1
~/bin/cb.sh
sleep 0.1
~/bin/bup.sh
sleep 0.1
~/bin/gpush.sh
sleep 0.1
pkill sleep
rm /var/tmp/sync.sh.flag
rm /var/tmp/gitpull.sh.flag

poweroff
