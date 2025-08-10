#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
  trap 'handle_error $LINENO' ERR

fh=~/.local/share/fish/fish_history
h=~/dotnix/home/modules/fish/fish_history

cat $fh >> $h
sed -i '/git remote set-url origin /d' $h
awk -i inplace '!seen[$0]++' $h
sed -i '/when:/d' $h

exit
