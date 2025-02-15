#!/usr/bin/env bash

exec foot sh -c "hyprctl monitors | grep eDP-2 &&  hyprctl keyword monitor eDP-2,disable || hyprctl keyword monitor HDMI-A-1,preferred,0x0,1"
