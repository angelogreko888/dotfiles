#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
  trap 'handle_error $LINENO' ERR


pgrep  sleep &> /dev/null || rm /var/tmp/sync.sh.flag && ~/bin/sync.sh &
