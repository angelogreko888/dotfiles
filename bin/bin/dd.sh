#!/usr/bin/env bash


lsblk
printf "\n\e[1;32m... iso path ... : \n\e[0m"
read iso
printf "\n\e[1;32m... usb path ... : \n\e[0m"
read usb

sudo dd bs=4M status=progress if=$iso of=/mnt/$usb
