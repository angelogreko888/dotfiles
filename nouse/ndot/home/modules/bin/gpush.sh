#!/usr/bin/env bash

  wget -q --spider http://google.com

  if [ $? -eq 0 ]; then
	~/bin/freetube.sh
	cd ~/ndot
	git add . && git commit -m "commit" && git push -u origin main

  else
  echo exit
  fi
