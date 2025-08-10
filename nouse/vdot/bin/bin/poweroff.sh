#!/usr/bin/env bash

rm -rf ~/.cache/* 
#~/bin/cb.sh
~/bin/bup.sh
#~/bin/gpush.sh
pkill sleep
rm /var/tmp/sync.sh.flag
rm /var/tmp/gitpull.sh.flag

poweroff
