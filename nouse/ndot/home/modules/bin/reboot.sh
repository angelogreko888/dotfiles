#!/usr/bin/env bash

if [ -f /var/tmp/sync.sh.flag ];then
	rm /var/tmp/sync.sh.flag
fi
~/bin/gpush.sh
reboot
