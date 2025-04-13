#!/usr/bin/env bash
rm -rf ~/.cache/* 
sleep 0.5
~/bin/cpbh.sh
sleep 0.5
~/bin/bup
sleep 0.5
~/bin/vtbup
sleep 0.5
~/bin/gpush.sh
sleep 0.5
poweroff
