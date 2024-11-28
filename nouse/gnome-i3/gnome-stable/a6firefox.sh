#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


sudo install -d -m 0755 /etc/apt/keyrings

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

echo ' 
          Package: *
          Pin: origin packages.mozilla.org
          Pin-Priority: 1000
          ' | tee /etc/apt/preferences.d/mozilla

sudo apt update && sudo apt install firefox -y
