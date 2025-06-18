#! usr/bin/env bash

a=$(hostnamectl | rg Model | awk '{print $3}')

if [ $a == LOQ ];then
env = AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0
elif [ $a == Lenovo ];then
#env = AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0
fi
