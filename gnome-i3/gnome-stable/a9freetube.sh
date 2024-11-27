#!/bin/bash
 
  handle_error() {
        echo "An error occurred on line $1"
        exit 1
    }
   
    trap 'handle_error $LINENO' ERR

mkdir -p /home/vago/git/freetube

cd /home/vago/git/freetube/

wget https://github.com/FreeTubeApp/FreeTube/releases/download/v0.21.1-beta/freetube_0.21.1_amd64.deb

sudo dpkg -i *.deb


