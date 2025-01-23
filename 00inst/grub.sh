#!/usr/bin/env bash

sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub

echo "Done!"

sudo grub-mkconfig -o /boot/grub/grub.cfg
