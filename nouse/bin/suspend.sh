#!/usr/bin/env bash

~/bin/gpush.sh
sleep 1
pidof hyprlock || (hyprlock & sleep 1s && systemctl suspend)
