#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR

a=$(hostnamectl | rg Model | awk '{print $3}')

if [ $a == LOQ ];then
	sed -i 's/^#env = AQ_DRM_DEVICES/env = AQ_DRM_DEVICES/'  ~/.config/hypr/env.conf
else
	sed -i 's/^env = AQ_DRM_DEVICES/#env = AQ_DRM_DEVICES/'  ~/.config/hypr/env.conf
fi

hyprctl reload
