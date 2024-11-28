#!/bin/bash

handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }
 
  trap 'handle_error $LINENO' ERR


sudo cp lib-firmware-i915/* /lib/firmware/i915/

echo "done"
