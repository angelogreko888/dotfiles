#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(hostnamectl | rg Model | awk '{print $3}')

if [ $a == LOQ ];then
	exec env = AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0
fi
