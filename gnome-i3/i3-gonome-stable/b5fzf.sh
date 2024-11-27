#!/bin/bash

 handle_error() {
       echo "An error occurred on line $1"
       exit 1
   }
  
   trap 'handle_error $LINENO' ERR

cd 

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

